boolean up, down, left, right;
ArrayList<GameObject> gameObjects = new ArrayList();

int astrdTimer = 300;

void gameSetup()
{
  player.init();
}

void gameDraw()
{
  background(0);
  
  astrdTimer++;
  if(astrdTimer >= 300 && random(1) <= 0.9)
  {
    astrdTimer = 0;
    spawnMeteor();
  }
  
   handleGameObjects();
   
   if(player.hp <= 0)
     mode = GAMEOVER;
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
  }
}

void spawnMeteor()
{
  PVector pos;
  PVector speed = new PVector(random(-2, 2), random(-2, 2));
  float size = random(60, 140);
  
  float random = random(1);
  if(random <= 0.25) //top
    pos = new PVector(random(-(size / 2), width + size / 2), -(size / 2));
  else if(random <= 0.5) //bottom
    pos = new PVector(random(-(size / 2), width + size / 2), height + size / 2);
  else if(random <= 0.75) //left
    pos = new PVector(-(size / 2), random(-(size / 2), height + size / 2));
  else //right
    pos = new PVector(width + size / 2, random(-(size / 2), height + size / 2));
    
  gameObjects.add(new Meteor(pos, speed, size, 1, random(-1, 1)));
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
  }
}

void gameMR()
{
  
}
