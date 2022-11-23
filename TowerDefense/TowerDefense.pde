//Tower Defense Game
//YOUR NAME GOES HERE
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
int mode = INTRO;

int lives = 3;
int cash = 20;
int difficulty = 0;

float rotation = 0;

//Pallette
color white = #ffffff;
color black = #000000;

color[][] palette;

//Buttons
Button start;
Button waveButton;
Button addTower;
Button addSniper;
Button addIncinedary;
Button[] difficultyButtons;

//Collections of objects
Node[][] nodes;
Node exampleNode;
Mob exampleMob;
Tower exampleTower;
Bullet exampleBullet;
AoE_Ring exampleRing;
ArrayList<Mob> mobs = new ArrayList<Mob>();
ArrayList<Tower> towers = new ArrayList<Tower>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<AoE_Ring> aoeRings = new ArrayList<AoE_Ring>();


//Images and Gifs

PImage[] bg;
PImage[] hpimg;
PImage[] mobimg;
Gif coinGif;

//Fonts


// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  setPalette();
  makeButtons();
  makeNodes();
}

// ===================== DRAW ===========================

void draw() {
  pmr();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  bg = new PImage[3];
  bg[0] = loadImage("/data/bg/grassBgTD.png");
  bg[1] = loadImage("/data/bg/lavaBgTD.png");
  bg[2] = loadImage("/data/bg/darkBgTD.png");

  mobimg = new PImage[3];
  mobimg[0] = loadImage("/data/characters/grassSlime.png");
  mobimg[1] = loadImage("/data/characters/lavaSlime.png");
  mobimg[2] = loadImage("/data/characters/darkSlime.png");

  hpimg = new PImage[4];
  hpimg[0] = loadImage("/data/lives/noLives.png");
  hpimg[1] = loadImage("/data/lives/oneLife.png");
  hpimg[2] = loadImage("/data/lives/twoLives.png");
  hpimg[3] = loadImage("/data/lives/threeLives.png");

  coinGif = new Gif(1, 50, 50, 100, 100, "data/coinGif/", "coin", 6, 10);

  //Load Fonts

  //Create Collections of Objects
}

void setPalette() {
  palette = new color[3][3];

  palette[0][0] = color(35, 170, 154);
  palette[0][1] = color(14, 53, 50);
  palette[0][2] = color(56, 184, 125);

  palette[1][0] = color(238, 73, 40);
  palette[1][1] = color(123, 16, 5);
  palette[1][2] = color(255, 254, 13);

  palette[2][0] = color(62, 47, 141);
  palette[2][1] = color(10, 7, 45);
  palette[2][2] = color(117, 113, 146);
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0], 3, 1);

  //PLAY - Next Wave, To Build Mode
  waveButton = new Button("NEXT\nWAVE", 950, 750, 75, 75, palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0], 3, 1);

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  addTower = new Button("GUN", 50, 750, 75, 75, palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0], 3, 1);
  addSniper = new Button("SNIPE", 150, 750, 75, 75, palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0], 3, 1);
  addIncinedary = new Button("FIRE", 250, 750, 75, 75, palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0], 3, 1);
  difficultyButtons = new Button[3];
  for (int i = 0; i < 3; i++) difficultyButtons[i] = new Button(0, 0, 100, 100);

  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  nodes = new Node[3][10];

  nodes[0][0] = new Node(100, 400, 0, -1);
  nodes[0][1] = new Node(100, 200, 1, 0);
  nodes[0][2] = new Node(300, 200, 0, 1);
  nodes[0][3] = new Node(300, 400, -1, 1);
  nodes[0][4] = new Node(100, 600, 1, 0);
  nodes[0][5] = new Node(300, 600, 1, -1);
  nodes[0][6] = new Node(500, 400, 0, -1);
  nodes[0][7] = new Node(500, 200, 1, 0);
  nodes[0][8] = new Node(900, 200, -1, 1);
  nodes[0][9] = new Node(500, 600, 1, -0);

  nodes[1][0] = new Node(100, 400, 0, -1);
  nodes[1][1] = new Node(100, 100, 1, 0);
  nodes[1][2] = new Node(200, 100, 0, 1);
  nodes[1][3] = new Node(200, 600, 1, 0);
  nodes[1][4] = new Node(400, 600, 0, -1);
  nodes[1][5] = new Node(400, 200, 1, 0);
  nodes[1][6] = new Node(600, 200, 0, 1);
  nodes[1][7] = new Node(600, 500, 1, 0);
  nodes[1][8] = new Node(850, 500, 0, -1);
  nodes[1][9] = new Node(850, 400, 1, 0);

  nodes[2][0] = new Node(0, 400, 1, 0);
  nodes[2][1] = new Node(50, 400, 0, -1);
  nodes[2][2] = new Node(50, 100, 1, 0);
  nodes[2][3] = new Node(500, 100, 0, 1);
  nodes[2][4] = new Node(500, 600, -1, 0);
  nodes[2][5] = new Node(200, 600, 0, -1);
  nodes[2][6] = new Node(200, 400, 1, 0);
  nodes[2][7] = new Node(800, 400, 0, -1);
  nodes[2][8] = new Node(800, 200, 1, 0);
  nodes[2][9] = new Node(-500, 400, 0, 0);
}

void makePath() {

  switch(difficulty) {
  case 0:
    stroke(100);
    strokeWeight(10);
    noFill();
    beginShape();
    vertex(0, 400);
    vertex(100, 400);
    vertex(100, 200);
    vertex(300, 200);
    vertex(300, 400);
    vertex(100, 600);
    vertex(300, 600);
    vertex(500, 400);
    vertex(500, 200);
    vertex(900, 200);
    vertex(500, 600);
    vertex(width, 600);
    endShape();
    break;
  case 1:
    stroke(100);
    strokeWeight(10);
    noFill();
    beginShape();
    vertex(0, 400);
    vertex(100, 400);
    vertex(100, 100);
    vertex(200, 100);
    vertex(200, 600);
    vertex(400, 600);
    vertex(400, 200);
    vertex(600, 200);
    vertex(600, 500);
    vertex(850, 500);
    vertex(850, 400);
    vertex(width, 400);
    endShape();
    break;
  case 2:
    stroke(100);
    strokeWeight(10);
    noFill();
    beginShape();
    vertex(0, 400);
    vertex(50, 400);
    vertex(50, 100);
    vertex(500, 100);
    vertex(500, 600);
    vertex(200, 600);
    vertex(200, 400);
    vertex(800, 400);
    vertex(800, 200);
    vertex(width, 200);
    endShape();
    break;
  }
}
