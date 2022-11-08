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
int cash = 100;
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

//Collections of objects
Node[] nodes;
Node exampleNode;
Mob exampleMob;
Tower exampleTower;
Bullet exampleBullet;
ArrayList<Mob> mobs = new ArrayList<Mob>();
ArrayList<Tower> towers = new ArrayList<Tower>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();



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
  addTower = new Button("TOWER", 50, 750, 75, 75, palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0], 3, 1);

  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  nodes = new Node[10];
  
  nodes[0] = new Node(100, 400, 0, -1);
  nodes[1] = new Node(100, 200, 1, 0);
  nodes[2] = new Node(300, 200, 0, 1);
  nodes[3] = new Node(300, 400, -1, 1);
  nodes[4] = new Node(100, 600, 1, 0);
  nodes[5] = new Node(300, 600, 1, -1);
  nodes[6] = new Node(500, 400, 0, -1);
  nodes[7] = new Node(500, 200, 1, 0);
  nodes[8] = new Node(900, 200, -1, 1);
  nodes[9] = new Node(500, 600, 1, -0);
  
}

void makePath() {
  stroke(100);
  strokeWeight(10);
  line(0, 400, 100, 400);
  line(100, 400, 100, 200);
  line(100, 200, 300, 200);
  line(300, 200, 300, 400);
  line(300, 400, 100, 600);
  line(100, 600, 300, 600);
  line(300, 600, 500, 400);
  line(500, 400, 500, 200);
  line(500, 200, 900, 200);
  line(900, 200, 500, 600);
  line(500, 600, width, 600);
}
