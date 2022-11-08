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

int mpcCooldown = 0;

boolean mpc(int cd) {
  if (mousePressed && mpcCooldown >= cd) {
    mpcCooldown = 0;
    return true;
  } else {
    mpcCooldown++;
    return false;
   
  }
}
