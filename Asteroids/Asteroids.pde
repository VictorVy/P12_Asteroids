/*
Hi Mr.Pelletier, check out the high score system! Please let me know there is a better or more optimal way of doing these 'cookies'. Thanks!
*/

//modes
int mode = -1;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//objects
Button bStart, bQuit, bResume, bRetry;

ArrayList<GameObject> gameObjects = new ArrayList();

Player player;

//variables
PFont font, fontBold;
int btnSize = 200;

PImage snapshot;

boolean transition = false;
int alphaUI = 0;
int fadeSpeedUI = 255 / 75;
int alphaBG = 0;

int highScore = 0;
int score;

void setup()
{
  mode = INTRO;
  
  size(1080, 720, P2D);
  rectMode(CENTER);
  
  font = createFont("Quicksand-Light.ttf", 255);
  fontBold = createFont("Quicksand-Regular.ttf", 255);

  bStart = new Button(width / 2, height - height / 3, btnSize, btnSize / 2, "start");
  bQuit = new Button(width / 2, height - height / 6, btnSize, btnSize / 2, "quit");
    
  bRetry = new Button(width / 2, height - height / 3, btnSize, btnSize / 2, "retry");
  
  //high score file
  if(sketchFile("highscore.txt").isFile())
    highScore = Integer.parseInt(loadStrings("highscore.txt")[0]);
  else
  {
    createWriter("highscore.txt");
    saveStrings("highscore.txt", new String[]{"0"});
  }
  
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
