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
  
  void act()
  {
    super.act();
    
    //collision
    int i = 0;
    while(i < gameObjects.size())
    {
      GameObject object = gameObjects.get(i);
      
      if(object instanceof Bullet && colliding(object))
      {
        hp--;
        object.hp--;
        
        if(hp == 0)
        {
          if(size > 100)
          {
            float random = random(2, 4);
            for(int k = 0; k < random; k++)
              gameObjects.add(new Meteor(new PVector(pos.x, pos.y), new PVector(random(-2, 2), random(-2, 2)), random(40, 80), 1, random(-1.5, 1.5)));
          }
        }
      }
      
      i++;
    }
    
    //bounds
    if(pos.x > width + size / 2)
      pos.x = -(size / 2);
    else if(pos.x < -(size / 2))
      pos.x = width + size / 2;
    if(pos.y > height + size / 2)
      pos.y = -(size / 2);
    else if(pos.y < 0 - size / 2)
      pos.y = height + size / 2;
  }
  
  public boolean colliding(GameObject object)
  { 
    return object.pos.x >= pos.x - size / 2 && object.pos.x <= pos.x + size / 2 && object.pos.y >= pos.y - size / 2 && object.pos.y <= pos.y + size / 2;
  }
}
