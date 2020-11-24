void gameoverDraw()
{
  background(255, 0, 0);
  
  bRestart.show();
  bQuit.show();
}

void gameoverKP()
{
  
}

void gameoverKR()
{
  
}

void gameoverMR()
{
  if(bRestart.mouseOver())
    mode = INTRO;
  if(bQuit.mouseOver())
    exit();
}
