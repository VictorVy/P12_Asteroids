void gameoverDraw()
{
  background(0); //TODO: overlay layer with incrementing alpha over background snapshot
  
  if(!transition)
    fadeInUI();
  else
    fadeOutUI();
  
  bRetry.show();
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
  if(bRetry.mouseOver())
  {
    mode = INTRO;
    introSetup();
  }
  if(bQuit.mouseOver())
    exit();
}
