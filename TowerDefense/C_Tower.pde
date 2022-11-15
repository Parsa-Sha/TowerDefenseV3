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

    if (mouseReleased && boundingBox(width/2, 325, width, 650) && towerMode == PLACING && globalCD > 10) {
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
      pushMatrix();
      translate(x, y);
      rotate();
      triangle(-25, -25, 25, -25, 0, 50);
    } else if (towerMode == PLACING) {
      triangle(mouseX-25, mouseY-25, mouseX+25, mouseY-25, mouseX, mouseY+50);
    }
    
    if (mouseReleased && boundingBox(width/2, 325, width, 650) && towerMode == PLACING && globalCD > 10 && cash >= (type+1)*10) {
      cd = 0;
      cash -= 15;
      towerMode = PLACED;
      x = mouseX;
      y = mouseY;
    }
  
  }
  
  void sniperShoot() {
    
  }
  
  void incinedaryDisplay() {
  
  }
  
  void incinedaryShoot() {
  
  }
} // End of Tower Class
