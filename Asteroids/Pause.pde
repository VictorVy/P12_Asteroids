void pauseDraw()
{
  //background
  image(snapshot, 0, 0);
  noStroke();
  fill(255, 32);
  rect(width / 2, height / 2, width, height);
  
  alphaUI = 255;
  
  bQuit.show();
}

void pauseKP()
{
  
}

void pauseKR()
{
  switch(key)
  {
    case 'p':
      alphaUI = 0;
      mode = GAME;
      break;
  }
}

void pauseMR()
{
  if(bQuit.mouseOver())
    exit();
  else
  {
    alphaUI = 0;
    mode = GAME;
  }
}
