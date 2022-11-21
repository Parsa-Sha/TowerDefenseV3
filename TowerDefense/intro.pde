//This function draws the INTRO screen.

PVector offset = new PVector(0, 100);

void intro() {
  background(bg[difficulty]);

  
  for (int i = 0; i < 3; i++) {
    offset.rotate(TWO_PI/3);
    
    difficultyButtons[i].x = width/2 + offset.x;
    difficultyButtons[i].y = height/2 + offset.y;

    if (difficultyButtons[2-i].press()) difficulty = i;
    image(mobimg[2-i], width/2 + offset.x, height/2 + offset.y, 100, 100);
  }
  offset.rotate(TWO_PI/200);
  
  start.show();
  if (start.press()) mode = PLAY;
}
