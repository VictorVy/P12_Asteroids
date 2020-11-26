void introDraw()
{
  background(0, 255, 0);
  
  bStart.show();
  bQuit.show();
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
    mode = GAME;
    gameSetup();
    
    if(!gameObjects.contains(player))
      gameObjects.add(player);
  }
  if(bQuit.mouseOver())
    exit();
}
