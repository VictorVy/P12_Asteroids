void introSetup()
{
  player = new Player();
  player.pos = new PVector(width / 2, height + player.size);
  
  gameObjects = new ArrayList();
  gameObjects.add(player);
}

void introDraw()
{
  background(0);
  
  if(player.introHover)
    fadeInUI();
  else
    fadeOutUI();

  if(!transition && random(1) < 0.0175)
    introMeteor();
  
  introGameObjects();
  
  title();
  
  bStart.show();
  bQuit.show();
  
  if(transition && alphaUI <= 0 && gameObjects.size() == 1)
  {
    transition = false;
    gameSetup();
    mode = GAME;
  }
}

void introMeteor()
{
  PVector pos;
  PVector speed = new PVector(random(-0.2, 0.2), random(6, 12));
  float size = random(60, 140);
  
  float random = random(1);
  if(random <= 0.5) //left
    pos = new PVector(random(-(size / 2), width / 3), -(size / 1.5));
  else  //right
    pos = new PVector(random(width - width / 3, width + size / 2), -(size / 1.5));
    
  gameObjects.add(new Meteor(pos, speed, size, 1, random(-2, 2)));
}

void introGameObjects()
{
  for(int i = 0; i < gameObjects.size(); i++)
  {
    GameObject object = gameObjects.get(i);

    if(object.hp > 0)
    {
      object.show();
      object.introAct();
    }
    else
    {
      gameObjects.remove(object);
      i--;
    }
  }
}

void title()
{
  fill(255, alphaUI);
  textFont(fontBold);
  textSize(128);
  textAlign(CENTER, CENTER);
  
  text("ASTEROIDS", width / 2, height / 5);
  
  //high score
  textSize(32);
  text("high score: " + highScore, width / 2, height / 12);
}

void introKP()
{
  
}

void introKR()
{
  
}

void introMR()
{
  if(bStart.mouseOver())
  {
    transition  = true;
    player.introHover = false;
  }
  if(bQuit.mouseOver())
    exit();
}
