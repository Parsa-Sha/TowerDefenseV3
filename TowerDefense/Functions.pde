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
