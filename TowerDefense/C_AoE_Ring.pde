//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoE_Ring {
  boolean landed;
  int cd, hp;
  float initialx, initialy, x, y, tx, ty, xdist, ydist, xtotalDist, ytotalDist;
  float distProgress, xdistProgress;

  AoE_Ring (float X, float Y, float TX, float TY) {
    x = initialx = X;
    y = initialy = Y;
    tx = TX;
    ty = TY;
    hp = 1;
    
    xdist = xtotalDist = tx-x;
    ydist = ytotalDist = ty-y;
  }

  void show() {
    calculate();
    display();
    damage();
  }

  void calculate() {
    xdist = tx-x;
    ydist = ty-y;
    distProgress = pythag(xdist, ydist)/pythag(xtotalDist, ytotalDist);
    xdistProgress = map(distProgress, 0, 1, 1, 0);
    x += (tx-x)*0.1;
    y += (ty-y)*0.1;  
  }

  void display() {
    strokeWeight(distProgress * 5);
    stroke(255, 0, 0);
    fill(255, 0, 0, xdistProgress * 120);
    circle(x, y, 100 * xdistProgress);
  }
  
  void damage() {
    
    if (mobs.size() != 0) {
      for (int i = 0; i < mobs.size(); i++) {
        exampleMob = mobs.get(i);
        if (dist(exampleMob.x, exampleMob.y, x, y) < 75 && cd % 100 == 0) {
          exampleMob.hp -= ceil(xdistProgress);
        } else cd++;
      }
    } else {
      cd++;
    }
    
    if (cd >= 500) hp = 0; 
  }
} // End of AoE_Ring class
