//This function draws the INTRO screen.

void intro() {
  background(100);
  
  pushMatrix();
  translate(width/2, height/2-50);
  
  
  for (int i = 0; i < 3; i++) {
    pushMatrix();
    rotate(rotation + (i*TWO_PI/3));
    translate(0, 100);
    rotate(-(rotation + (i*TWO_PI/3)));
    image(mobimg[2-i], 0, 0, 100, 100);  
    popMatrix();
  }
  
  rotation += TWO_PI/200;
  popMatrix();
  
  start.show();
  if (start.press()) mode = PLAY;
}
