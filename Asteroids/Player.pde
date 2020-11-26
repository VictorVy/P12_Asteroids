class Player extends GameObject
{
  PVector dir;
  int maxSpeed;
  float turnSpeed, airRes;
  
  boolean moveF, moveB, turnL, turnR, shoot;
  int shootTimer, exhaustTimer;
  
  public Player()
  {
    init();
    
    maxSpeed = 5;
    size = 30;
    colour = 255;
    turnSpeed = radians(4);
    shootTimer = 20;
    airRes = 0.04;
    exhaustTimer = 0;
  }
  
  void init()
  {
    pos = new PVector(width / 2, height / 2);
    speed = new PVector(0, 0);
    dir = new PVector(0, -0.12);
    hp = 3;
  }
  
  void show()
  {
    noFill();
    stroke(colour);
    strokeWeight(size / 7);
    
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(dir.heading());
    
    triangle(size / 2, 0, -(size / 2), -(size / 3), -(size / 2), size / 3);
    line(size / 2, 0, -(size / 2) - size / 4, 0);
    
    popMatrix();
  }
  
  void act()
  {
    super.act();
    
    //movement
    if(moveF)
      speed.add(dir);
    if(moveB)
      speed.sub(dir);
    if(turnL)
      dir.rotate(-turnSpeed);
    if(turnR)
      dir.rotate(turnSpeed);
    
    if(speed.mag() > 0)
      speed.setMag(speed.mag() - airRes);
    if(speed.mag() > maxSpeed)
      speed.setMag(maxSpeed);
    
    //shooting
    shootTimer++;
    if(shoot && shootTimer >= 20)
    {
      gameObjects.add(new Bullet(pos.copy(), dir.copy(), size / 6));
      shootTimer = 0;
    }
    
    //exhaust
    exhaustTimer++;;
    if(moveF && exhaustTimer >= 6)
    {
      gameObjects.add(new Exhaust(new PVector(pos.x, pos.y), new PVector(random(-0.5, 0.5), random(-0.5, -1.5)), random(size / 6, size / 2), random(128, 216), random(2, 6), random(-8, 8)));
      exhaustTimer = 0;
    }
    
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
}
