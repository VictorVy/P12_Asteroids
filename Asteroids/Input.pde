void keyPressed()
{
  switch(mode)
  {
    case INTRO:
      introKP();
      break;
    case GAME:
      gameKP();
      break;
    case PAUSE:
      pauseKP();
      break;
    case GAMEOVER:
      gameoverKP();
      break;
    default:
      println("Mode Error: " + mode);
      break;
  }
}

void keyReleased()
{
  switch(mode)
  {
    case INTRO:
      introKR();
      break;
    case GAME:
      gameKR();
      break;
    case PAUSE:
      pauseKR();
      break;
    case GAMEOVER:
      gameoverKR();
      break;
    default:
      println("Mode Error: " + mode);
      break;
  }
}

void mouseReleased()
{
  switch(mode)
  {
    case INTRO:
      introMR();
      break;
    case GAME:
      gameMR();
      break;
    case PAUSE:
      pauseMR();
      break;
    case GAMEOVER:
      gameoverMR();
      break;
    default:
      println("Mode Error: " + mode);
      break;
  }
}
