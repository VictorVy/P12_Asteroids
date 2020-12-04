boolean up, down, left, right, noParticles;

int astrdTimer = 360;
int ufoTimer = 0;

void gameSetup()
{
  gameObjects = new ArrayList();
  gameObjects.add(player);
  noParticles = true;
}

void gameDraw()
{
  
  background(0);
  
  //spawn meteors
  astrdTimer++;
  if(astrdTimer >= 360 && random(1) <= 0.9)
  {
    astrdTimer = 0;
    gameMeteor();
  }
  
  //spawn UFOs
  ufoTimer++;
  if(ufoTimer >= 1080)
  {
    ufoTimer = 0;
    gameUFO();
  }
  
  handleGameObjects();
  
  //handle gameover
  if(player.hp <= 0 && noParticles)
  {
    snapshot = get();
    alphaBG = 0;
    mode = GAMEOVER;
  }
}

void handleGameObjects()
{
  for(int i = 0; i < gameObjects.size(); i++)
  {
    GameObject object = gameObjects.get(i);
    
    if(object.hp > 0)
    {
      object.show();
      object.act();
    }
    else
    {
      gameObjects.remove(object);
      i--;
    }
    
    noParticles = !(object instanceof Particle);
  }
}

void gameMeteor()
{
  PVector pos, speed;
  float size = random(60, 140);
  
  float random = random(1);
  if(random <= 0.25) //top
  {
    pos = new PVector(random(-(size / 2), width + size / 2), -(size / 2));
    speed = new PVector(random(-2, 2), random(1, 2));
  }
  else if(random <= 0.5) //bottom
  {
    pos = new PVector(random(-(size / 2), width + size / 2), height + size / 2);
    speed = new PVector(random(-2, 2), random(-1, -2));
  }
  else if(random <= 0.75) //left
  {
    pos = new PVector(-(size / 2), random(-(size / 2), height + size / 2));
    speed = new PVector(random(1, 2), random(-2, 2));
  }
  else //right
  {
    pos = new PVector(width + size / 2, random(-(size / 2), height + size / 2));
    speed = new PVector(random(-1, -2), random(-2, 2));
  }
   
  gameObjects.add(new Meteor(pos, speed, size, 1, random(-1, 1)));
}

void gameUFO()
{
  PVector pos, speed;
  float size = random(25, 35);
  
  float random = random(1);
  if(random <= 0.25) //top
  {
    pos = new PVector(random(-(size / 2), width + size / 2), -(size / 2));
    speed = new PVector(random(-3, 3), random(2, 3));
  }
  else if(random <= 0.5) //bottom
  {
    pos = new PVector(random(-(size / 2), width + size / 2), height + size / 2);
    speed = new PVector(random(-3, 3), random(-2, -3));
  }
  else if(random <= 0.75) //left
  {
    pos = new PVector(-(size / 2), random(-(size / 2), height + size / 2));
    speed = new PVector(random(2, 3), random(-3, 3));
  }
  else //right
  {
    pos = new PVector(width + size / 2, random(-(size / 2), height + size / 2));
    speed = new PVector(random(-2, -3), random(-3, 3));
  }
    
  gameObjects.add(new UFO(pos, speed, size));
}

void gameKP()
{
  switch(keyCode)
  {
    case UP:
      player.moveF = true;
      break;
    case DOWN:
      player.moveB = true;
      break;
    case LEFT:
      player.turnL = true;
      break;
    case RIGHT:
      player.turnR = true;
      break;
  }
  
  switch(key)
  {
    case ' ':
      player.shoot = true;
      break;
  }
}

void gameKR()
{
  switch(keyCode)
  {
    case UP:
      player.moveF = false;
      break;
    case DOWN:
      player.moveB = false;
      break;
    case LEFT:
      player.turnL = false;
      break;
    case RIGHT:
      player.turnR = false;
      break;
  }
  
  switch(key)
  {
    case ' ':
      player.shoot = false;;
      break;
    case 'p':
      snapshot = get();
      mode = PAUSE;
      break;
  }
}

void gameMR()
{
  switch(mouseButton)
  {
    case LEFT: case RIGHT: case CENTER:
      snapshot = get();
      mode = PAUSE;
      break;
  }
}
