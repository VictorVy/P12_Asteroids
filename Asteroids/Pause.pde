void pauseDraw()
{
  //background
  image(snapshot, 0, 0);
  noStroke();
  fill(255, 32);
  rect(width / 2, height / 2, width, height);
  
  alphaUI = 255;
  
  //display high score
  fill(255, alphaUI);
  textFont(fontBold);
  textSize(80);
  textAlign(CENTER, CENTER);
  
  text("HIGH SCORE: " + highScore, width / 2, height / 4);
  
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
      mode = GAME;
      break;
  }
}

void pauseMR()
{
  if(bQuit.mouseOver())
    exit();
  else
    mode = GAME;
}
