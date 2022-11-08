//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {
  float x, y, vx, vy, s;
  int hp;
  
  Bullet (float X, float Y, float VX, float VY) {
    x = X;
    y = Y;
    vx = VX;
    vy = VY;
    hp = 1;
    s = 15;
  }
  
  void show() {
    x += vx;
    y += vy;
    
    strokeWeight(0);
    fill(0, 100, 200);
    circle(x, y, s);
    
    checkPos();
  }
  
  void checkPos() {
    if (x < 0 || x > width || y < 0 || y > height) hp = 0;
  }
}
