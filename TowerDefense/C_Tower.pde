//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  float x, y;
  int type, cd, threshold;

  final int PLACING = 0;
  final int PLACED = 1;
  int towerMode;

  Tower (int Type, float X, float Y, int CD, int Threshold) {
    type = Type;
    x = X;
    y = Y;
    cd = CD;
    threshold = Threshold;
  }

  void show() {
    switch(type) {
    case 0:
      gunDisplay();
      gunShoot();
      break;

    case 1:
      sniperDisplay();
      sniperShoot();
      break;

    case 2:
      incinedaryDisplay();
      incinedaryShoot();
      break;
    }
  }

  void gunDisplay() {
    stroke(0);
    strokeWeight(3);
    fill(0, 0, 255);
    if (towerMode == PLACED) square(x, y, 50);
    else if (towerMode == PLACING) square(mouseX, mouseY, 50);

    if (mouseReleased && boundingBox(width/2, 325, width, 650) && towerMode == PLACING && globalCD > 10 && cash >= 10) {
      cd = 0;
      cash -= 10;
      towerMode = PLACED;
      x = mouseX;
      y = mouseY;
    }
  }

  void gunShoot() {
    if (mobs.size() != 0) {
      cd++;
      if (cd == threshold) {
        cd = 0;
        bullets.add(new Bullet(x, y, 0, 5));
        bullets.add(new Bullet(x, y, 0, -5));
        bullets.add(new Bullet(x, y, 5, 0));
        bullets.add(new Bullet(x, y, -5, 0));
      }
    } else cd = 0;
  }
  
  void sniperDisplay() {
    stroke(0);
    strokeWeight(3);
    fill(100, 100, 150);
    
    if (towerMode == PLACED){
      triangle(x-25, y-25, x+25, y-25, x, y+50);
    } else if (towerMode == PLACING) {
      triangle(mouseX-25, mouseY-25, mouseX+25, mouseY-25, mouseX, mouseY+50);
    }
    
    if (mouseReleased && mouseY < 650 && towerMode == PLACING && globalCD > 10 && cash >= 15) {
      cd = 0;
      cash -= 15;
      towerMode = PLACED;
      x = mouseX;
      y = mouseY;
    }
  
  }
  
  void sniperShoot() {
    if (mobs.size() != 0) {
      cd++;
      stroke(255*cd/threshold, 0, 0, 255*cd/threshold);
      strokeWeight(3*cd/threshold);
      line(x, y, mobs.get(0).x, mobs.get(0).y);
      
      if (cd == threshold) {
        mobs.get(0).hp -= 2;
        cd = 0;
      }
    } else cd = 0;
  }
  
  void incinedaryDisplay() {
    stroke(0);
    strokeWeight(3);
    fill(200, 0, 0);
    if (towerMode == PLACED) circle(x, y, 50);
    else if (towerMode == PLACING) circle(mouseX, mouseY, 50);

    if (mouseReleased && boundingBox(width/2, 325, width, 650) && towerMode == PLACING && globalCD > 10 && cash >= 20) {
      cd = 0;
      cash -= 20;
      towerMode = PLACED;
      x = mouseX;
      y = mouseY;
    }
  }
  
  void incinedaryShoot() {
    if (mobs.size() != 0) {
      cd++;
      if (cd == threshold) {
        int ex = floor(random(mobs.size()));
        exampleMob = mobs.get(ex);
        aoeRings.add(new AoE_Ring(x, y, exampleMob.x, exampleMob.y));
        cd = 0;
      }
    } else cd = 0;
  }
} // End of Tower Class
