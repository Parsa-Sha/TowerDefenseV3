//This function draws the GAMEOVER screen.

int gmovrTimer = 0;

void gameOver() {
  ifDifficultyChanges();
  if (mousePressed) mode = INTRO;


  gmovrTimer++;

  if (gmovrTimer > 300) {
    fill(palette[difficulty][1]);
    textSize(50);
    text("GAMEOVER", width/2, height/3);
  }

  if (gmovrTimer > 600) {
    textSize(30);
    text("LAST WAVE: " + wave, width/2, height/2);
  }

  if (gmovrTimer > 900) {
    textSize(80);
    text("YOU SUCK LMAO", width/2, height*2/3);
  }
}
