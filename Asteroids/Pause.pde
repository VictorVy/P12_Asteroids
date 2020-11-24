void pauseDraw()
{
  background(126);
  
  bResume.show();
  bQuit.show();
}

void pauseKP()
{
  
}

void pauseKR()
{
  
}

void pauseMR()
{
  if(bResume.mouseOver())
    mode = GAME;
  if(bQuit.mouseOver())
    exit();
}
