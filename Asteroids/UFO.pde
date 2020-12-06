class UFO extends GameObject
{
  PVector dir;
  int shootTimer;
  
  public UFO(PVector pos, PVector speed, float size)
  {
    this.pos = pos;
    this.speed = speed;
    this.size = size;
    hp = 1;
    colour = 255;
    shootTimer = 0;
  }
  
  void show()
  {
    noFill();
    
    stroke(colour);
    
    strokeWeight(size / 7);
    
    pushMatrix();
    
    translate(pos.x, pos.y);
    
    dir = new PVector(player.pos.x - pos.x, player.pos.y - pos.y);
    
    rotate(dir.heading());
    
    circle(-(size / 2), 0, size / 1.28);
    fill(0);
    triangle(size / 2, 0, -(size / 2), -(size / 2.5), -(size / 2), size / 2.5);
    
    popMatrix();
  }
  
  void act()
  {
    super.act();
    
    //shooting
    shoot();
    
    //collisions
    collide();
    
    //bounds
    if(pos.x > width + size / 1.5 || pos.x < -(size / 1.5) || pos.y > height + size / 1.5 || pos.y < -(size / 1.5))
      hp = 0;
  }
  
  void shoot()
  {
    shootTimer++;
    if(shootTimer >= 180)
    {
      gameObjects.add(new Bullet(pos.copy(), dir.copy(), size / 6, 8, false));
      shootTimer = 0;
    }
  }
  
  void takeDamage()
  {
    hp--;
    
    //explosion particles
    float random = random(8, 12);
    for(int k = 0; k < random; k++)
      gameObjects.add(new Particle(pos.copy(), new PVector(random(-3, 3), random(-3, 3)), random(size / 6, size / 2), random(200, 250), random(4, 8), random(-8, 8)));
  }
  
  void collide()
  {
    for(int i = 0; i < gameObjects.size(); i++) //will not loop properly due to same loop in other tabs
    {
      GameObject object = gameObjects.get(i);
      
      pushMatrix();
      
      translate(pos.x, pos.y);
      rotate(dir.heading());
      
      if(object instanceof Bullet && object.friendly && colliding(object))
      {
        takeDamage();
        object.hp--;
        score += 10;
      }
      
      popMatrix();
    }
  }
  
  boolean colliding(GameObject object)
  {
    return object.pos.x >= pos.x - size / 2 && object.pos.x <= pos.x + size / 2 && object.pos.y >= pos.y - size / 2 && object.pos.y <= pos.y + size / 2;
  }
}
