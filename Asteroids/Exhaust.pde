class Exhaust extends GameObject
{
  float alpha, alphaSpeed, dir, turnSpeed, airRes;
  
  public Exhaust(PVector pos, PVector speed, float size, float alpha, float alphaSpeed, float turnSpeed)
  {
    this.pos = pos;
    this.speed = speed;
    this.size = size;
    colour = 255;
    this.alpha = alpha;
    this.alphaSpeed = alphaSpeed;
    this.turnSpeed = radians(turnSpeed);
    hp = 1;

  }
  
  void show()
  {
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(dir);
    dir += turnSpeed;
    
    noFill();
    stroke(colour, alpha);
    alpha -= alphaSpeed;
    strokeWeight(size / 5);
    
    triangle(0, -size / 2, size / 2, size / 2, -(size / 2), size / 2);
    
    popMatrix();
  }
  
  void act()
  {
    super.act();
    
    if(speed.mag() > 0)
      speed.setMag(speed.mag() - airRes);
    
    if(alpha <= 0)
      hp = 0;
  }
}
