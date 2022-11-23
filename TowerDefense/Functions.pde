boolean boundingBox(float x, float y, float w, float h) {
  if (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2)  return true;
  return false;
}

float pythag(float a, float b) {
  return sqrt(pow(a, 2) + pow(b, 2));
}

PVector polarToLinear(float a, float m) {
  PVector linear;
  linear = new PVector(m * cos(a), m * sin(a));
  return linear;
}

boolean mouseReleased;
boolean wasPressed;

void pmr() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) {
    mouseReleased = true;
    wasPressed = false;
  }
}

boolean isPlacing() {
  for (int i = 0; i < towers.size(); i++) {
    if (towers.get(i).towerMode == exampleTower.PLACING) return true;
  }
  return false;
}

PVector xydist(float x1, float y1, float x2, float y2) {
  float x = x2 - x1;
  float y = y2 - y1;
  PVector xy = new PVector(x, y);
  return xy;
}

int pastDif = -1;

void ifDifficultyChanges() {
  if (difficulty != pastDif) {
    start.updateColours(palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0]);
    waveButton.updateColours(palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0]);
    addTower.updateColours(palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0]);
    addSniper.updateColours(palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0]);
    addIncinedary.updateColours(palette[difficulty][2], palette[difficulty][1], palette[difficulty][1], palette[difficulty][0]);
  }
  pastDif = difficulty;
}
