//modes
int mode = -1;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//objects
Button bStart;
Button bQuit;

Button bGameover;
Button bPause;

Button bResume;

Button bRestart;

Player player;

void setup()
{
  size(800, 600);
  rectMode(CENTER);
  
  mode = INTRO;
  
  bStart = new Button(width / 2, height / 2, 200, 100, "start");
  bQuit = new Button(width / 2, height - height / 4, 200, 100, "quit");
  
  bGameover = new Button(width / 2, height / 2, 200, 100, "end");
  bPause = new Button(width / 2, height - height / 4, 200, 100, "pause");
  
  bResume = new Button(width / 2, height / 2, 200, 100, "resume");
  
  bRestart = new Button(width / 2, height / 2, 200, 100, "restart");
  
  player = new Player();
}

void draw()
{
  switch(mode)
  {
    case INTRO:
      introDraw();
      break;
    case GAME:
      gameDraw();
      break;
    case PAUSE:
      pauseDraw();
      break;
    case GAMEOVER:
      gameoverDraw();
      break;
    default:
      println("Mode Error: " + mode);
      break;
  }
}
