//modes
int mode = -1;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//objects
Button bStart;
Button bQuit;

ArrayList<GameObject> gameObjects = new ArrayList();

Button bResume;

Button bRetry;

Player player;

//variables
PFont font, fontBold;
int btnSize = 200;

boolean transition = false;

int alphaUI = 0;
int fadeSpeedUI = 255 / 75;

void setup()
{
  mode = INTRO;
  
  size(1080, 720, P2D);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  font = createFont("Quicksand-Light.ttf", 255);
  fontBold = createFont("Quicksand-Regular.ttf", 255);

  bStart = new Button(width / 2, height - height / 3, btnSize, btnSize / 2, "start");
  bQuit = new Button(width / 2, height - height / 6, btnSize, btnSize / 2, "quit");
  
  bResume = new Button(width / 2, height / 2, btnSize, btnSize / 2, "resume");
  
  bRetry = new Button(width / 2, height - height / 3, btnSize, btnSize / 2, "retry");
  
  introSetup();
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

void fadeInUI()
{
  if(alphaUI < 255)
    alphaUI += fadeSpeedUI;
}

void fadeOutUI()
{
  if(alphaUI > 0)
    alphaUI -= fadeSpeedUI;
}
