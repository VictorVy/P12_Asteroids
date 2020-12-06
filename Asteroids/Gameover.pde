void gameoverDraw()
{
  //background
  image(snapshot, 0, 0);
  noStroke();
  fill(0, alphaBG);
  rect(width / 2, height / 2, width, height);
  if(alphaBG <= 128)
    alphaBG += fadeSpeedUI / 2;
  
  if(!transition)
    fadeInUI();
  else
  {
    fadeOutUI();
    alphaBG += fadeSpeedUI;
  }
  
  if(transition && alphaUI <= 0)
  {
    transition = false;
    mode = INTRO;
    introSetup();
  }
  
  //display score
  fill(255, alphaUI);
  textFont(fontBold);
  textSize(80);
  textAlign(CENTER, CENTER);
  
  text("SCORE: " + score, width / 2, height / 6);
  text("HIGH SCORE: " + highScore, width / 2, height / 3);
  
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
    transition = true;
  if(bQuit.mouseOver())
    exit();
}
