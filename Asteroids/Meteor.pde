class Meteor extends GameObject
{
  //float spread;
  float dir, turnSpeed;
  
  public Meteor(PVector pos, PVector speed, float size, int hp, float turnSpeed)
  {
    this.pos = pos;
    this.speed = speed;
    this.size = size;
    //spread = size / 10;
    this.hp = hp;
    this.turnSpeed = radians(turnSpeed);
    colour = 255;
  }
  
  void show()
  {
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(dir);
    dir += turnSpeed;
    
    noFill();
    stroke(colour);
    strokeWeight(size / 12);
    
    rect(0, 0, size, size);
    
    popMatrix();
  }
  
  void introAct()
  {
    super.act();
    
    //bounds
    if(pos.y > height + size / 1.5)
      hp = 0;
  }
  
  void act()
  {
    super.act();
    
    //collision
    for(int i = 0; i < gameObjects.size(); i++) //will not loop properly due to same loop in other tabs
    {
      GameObject object = gameObjects.get(i);
      
      pushMatrix();
      
      translate(pos.x, pos.y);
      rotate(dir);
      
      if(object instanceof Player && colliding(object))
        player.takeDamage();
      else if(object instanceof Bullet && object.friendly && colliding(object))
      {
        hp--;
        object.hp--;
        
        if(hp == 0)
        {
          if(size > 100) //new meteors
          {
            float random = random(2, 4);
            for(int k = 0; k < random; k++)
              gameObjects.add(new Meteor(new PVector(pos.x, pos.y), new PVector(random(-2, 2), random(-2, 2)), random(40, 80), 1, random(-1.5, 1.5)));
          }
          else
            i--;
            
          //explosion particles
          float random = random(6, 10);
          for(int k = 0; k < random; k++)
            gameObjects.add(new Particle(pos.copy(), new PVector(random(-3, 3), random(-3, 3)), random(size / 8, size / 4), random(200, 250), random(4, 8), random(-8, 8)));
        }
      }
      
      popMatrix();
    }
    
    //bounds
    if(pos.x > width + size / 1.5)
      pos.x = -(size / 1.5);
    else if(pos.x < -(size / 1.5))
      pos.x = width + size / 1.5;
    if(pos.y > height + size / 1.5)
      pos.y = -(size / 1.5);
    else if(pos.y < -(size / 1.5))
      pos.y = height + size / 1.5;
  }
  
  public boolean colliding(GameObject object)
  { 
    return object.pos.x >= pos.x - size / 2 && object.pos.x <= pos.x + size / 2 && object.pos.y >= pos.y - size / 2 && object.pos.y <= pos.y + size / 2;
  }
}
