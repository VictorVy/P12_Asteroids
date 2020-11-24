class Meteor extends GameObject
{
  float spread;
  float dir, turnSpeed;
  
  public Meteor(PVector pos, PVector speed, float size, int hp, float turnSpeed)
  {
    this.pos = pos;
    this.speed = speed;
    this.size = size;
    spread = size / 10;
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
}
