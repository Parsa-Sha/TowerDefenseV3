//This function draws the PLAY screen

float timer = 0;
int wave = 0;
int globalCD = 0;


void play() {
  background(0, 255, 0);
  image(bg[difficulty], width/2, height/2);
  makePath();
  mobAct();
  towerAct();
  bulletAct();
  ringsAct();
  ifDifficultyChanges();
  
  globalCD++;

  if (lives <= 0) mode = GAMEOVER;
  image(hpimg[lives], 850, 50); // Lives image
  coinGif.show();
  textSize(50);
  fill(palette[difficulty][2]);
  text("CASH: " + cash, 200, 40);
  
  toolbar();
}



void nextWave() {
  if (mobs.size() == 0) {
    wave++;
    for (int i = 0; i < wave; i++) {
      if (wave >= 4 && i == 3){
        mobs.add(new Mob(-i*50, height/2, 100, 5, 1));
      } else if (wave >= 7 && (i == 5|| i == 6)) mobs.add(new Mob(-i*50, height/2, 20, 2, 3)); 
      else mobs.add(new Mob(-i*50, height/2, 50, 3, 2));
    }
  }
}

void toolbar() {
  strokeWeight(0);
  fill(palette[difficulty][1]);
  rect(width/2, 725, width, 150);
  waveButton.show();
  if (waveButton.press()) nextWave();
  addTower.show();
  if (addTower.press() && !isPlacing() && cash >= 10) towers.add(new Tower(0, mouseX, mouseY, 0, 50));
  addSniper.show();
  if (addSniper.press() && !isPlacing() && cash >= 15) towers.add(new Tower(1, mouseX, mouseY, 0, 200));
  addIncinedary.show();
  if (addIncinedary.press() && !isPlacing() && cash >= 20) towers.add(new Tower(2, mouseX, mouseY, 0, 100));
}

void mobAct() {
  for (int i = 0; i < mobs.size(); i++) {
    exampleMob = mobs.get(i);
    exampleMob.act();
    
    if (exampleMob.hp <= 0) {
      mobs.remove(i);
      i--;
    }
  }
}

void towerAct() {
  for (int i = 0; i < towers.size(); i++) {
    exampleTower = towers.get(i);
    exampleTower.show();
  }
}

void bulletAct() {
  for (int i = 0; i < bullets.size(); i++) {
    exampleBullet = bullets.get(i);
    exampleBullet.show();
    if (exampleBullet.hp <= 0) {
      bullets.remove(i);
      i--;
    }
  }
}

void ringsAct() {
  for (int i = 0; i < aoeRings.size(); i++) {
    exampleRing = aoeRings.get(i);
    exampleRing.show();
    if (exampleRing.hp <= 0) {
      aoeRings.remove(i);
      i--;
    }
  }
} 
