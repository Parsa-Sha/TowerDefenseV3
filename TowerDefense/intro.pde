//This function draws the INTRO screen.

void intro() {
  background(bg[difficulty]);
  
  pushMatrix();
  translate(width/2, height/2-50);
  
  
  for (int i = 0; i < 3; i++) {
    pushMatrix();
    rotate(rotation + (i*TWO_PI/3));
    translate(0, 100);
    rotate(-(rotation + (i*TWO_PI/3)));
    
    difficultyButtons[i].x = 0;
    difficultyButtons[i].y = 0;
    println(difficultyButtons[i].hover());
    
    if (difficultyButtons[i].press()) difficulty = i;
    image(mobimg[2-i], 0, 0, 100, 100);
    popMatrix();
  }
  
  rotation += TWO_PI/200;
  popMatrix();
  
  
  start.show();
  if (start.press()) mode = PLAY;
}
