class Player extends GameObject
{
  PVector dir;
  int maxSpeed;
  float turnSpeed, airRes;
  
  boolean moveF, moveB, turnL, turnR, shoot, damageFlicker;
  int shootTimer, exhaustTimer, damageTimer, flickerSpeed;
  
  boolean introHover = false;
  boolean introMoveF = false;
  
  public Player()
  {
    init();
    
    maxSpeed = 4;
    size = 30;
    colour = 255;
    turnSpeed = radians(4);
    shootTimer = 20;
    airRes = 0.04;
    exhaustTimer = 0;
    flickerSpeed = 10;
    
    friendly = true;
  }
  
  void init()
  {
    pos = new PVector(width / 2, height - height / 3);
    speed = new PVector(0, 0);
    dir = new PVector(0, -0.12);
    hp = 3;
    damageTimer = -1;
    
    moveF = moveB = turnL = turnR = shoot = damageFlicker = false;
  }
  
  void show()
  {
    noFill();
    
    stroke(colour, damageFlicker ? 64 : 255);
    
    strokeWeight(size / 7);
    
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(dir.heading());
    
    triangle(size / 2, 0, -(size / 2), -(size / 3), -(size / 2), size / 3);
    line(size / 2, 0, -(size / 2) - size / 4, 0);
    
    popMatrix();
  }
  
  void introAct()
  {
    super.act();
    
    //movement
    if(!introHover)
    {
      if(!transition)
      {
        //coming on screen
        if(pos.y > height - height / 3)
        {
          speed.setMag(maxSpeed);
          moveF(dir);
        }
        else if(speed.mag() > 0.01)
          speed.setMag(speed.mag() - airRes);
        else
          introHover = true;
      }
      else
      {
        //transitioning to GAME mode
        if(pos.y < height - height / 3)
          moveB(dir.copy().div(4));
      }
    }
    else
    {
      //moving back and forth
      if(introMoveF)
      {
        moveF(dir.copy().div(10));
        if(pos.y < height / 2 - 20)
          introMoveF = false;
      }
      else
      {
        moveB(dir.copy().div(10));
        if(pos.y > height / 2 - 20)
          introMoveF = true;
      }
      
      if(speed.mag() > maxSpeed / 4)
        speed.setMag(maxSpeed / 4);
    }
    
    //exhaust particles
    if(!transition)
    {
      exhaustTimer++;
      if(exhaustTimer >= 5)
      {
        gameObjects.add(new Particle(new PVector(pos.x, pos.y), new PVector(random(-0.5, 0.5), random(3, 6)), random(size / 6, size / 2), random(128, 216), random(2, 6), random(-8, 8)));
        exhaustTimer = 0;
      }
    }
  }
  
  void act()
  {
    super.act();
    
    //movement
    if(moveF)
      moveF(dir);
    if(moveB)
      moveB(dir);
    if(turnL)
      dir.rotate(-turnSpeed);
    if(turnR)
      dir.rotate(turnSpeed);
    
    if(speed.mag() > 0)
      speed.setMag(speed.mag() - airRes);
    if(speed.mag() > maxSpeed)
      speed.setMag(maxSpeed);
    
    //shooting
    shoot();
    
    //collision
    collide();
    
    //exhaust particles
    exhaust();
    
    //handling damage
    if (damageTimer > -1)
      damageTimer--;
    else
      damageFlicker = false;
    
    if(damageTimer % flickerSpeed == 0)
      damageFlicker = !damageFlicker;
    
    //bounds
    if(pos.x > width + size / 2)
      pos.x = -(size / 2);
    else if(pos.x < -(size / 2))
      pos.x = width + size / 2;
    if(pos.y > height + size / 2)
      pos.y = -(size / 2);
    else if(pos.y < -(size / 2))
      pos.y = height + size / 2;
  }
  
  void moveF(PVector dir) { speed.add(dir); }
  void moveB(PVector dir) { speed.sub(dir); }
  
  void shoot()
  {
    shootTimer++;
    if(shoot && shootTimer >= 20)
    {
      gameObjects.add(new Bullet(pos.copy(), dir.copy(), size / 6, 10, true));
      shootTimer = 0;
    }
  }
  
  void exhaust()
  {
    exhaustTimer++;
    if(moveF && exhaustTimer >= 5)
    {
      gameObjects.add(new Particle(new PVector(pos.x, pos.y), new PVector(random(-0.5, 0.5), random(0.5, 1.5)), random(size / 6, size / 2), random(128, 216), random(2, 6), random(-8, 8)));
      exhaustTimer = 0;
    }
  }
  
  void takeDamage()
  {
    if(damageTimer <= 0)
    {
      hp--;
      damageTimer = 180;
      damageFlicker = true;
      
      //explosion particles
      float random = random(8, 12);
      for(int k = 0; k < random; k++)
        gameObjects.add(new Particle(pos.copy(), new PVector(random(-3, 3), random(-3, 3)), random(size / 6, size / 2), random(200, 250), random(4, 8), random(-8, 8)));
    }
  }
  
  void collide()
  {
    for(int i = 0; i < gameObjects.size(); i++) //will not loop properly due to same loop in other tabs
    {
      GameObject object = gameObjects.get(i);
      
      pushMatrix();
      
      translate(pos.x, pos.y);
      rotate(dir.heading());
      
      if(object instanceof Bullet && !object.friendly && colliding(object))
      {
        takeDamage();
        object.hp--;
      }
      if(object instanceof UFO && colliding(object))
        takeDamage();
      
      popMatrix();
    }
  }
  
  boolean colliding(GameObject object)
  {
    return object.pos.x >= pos.x - size / 3 && object.pos.x <= pos.x + size / 3 && object.pos.y >= pos.y - size / 3 && object.pos.y <= pos.y + size / 3;
  }
}
