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

  globalCD++;

  if (lives <= 0) mode = GAMEOVER;
  image(hpimg[lives], 850, 50); // Lives image

  println(mpc(10), cash);
  
  
  strokeWeight(0);
  fill(palette[difficulty][1]);
  rect(width/2, 725, width, 150);
  waveButton.show();
  if (waveButton.press()) nextWave();
  addTower.show();
  if (addTower.press()) towers.add(new Tower(0, mouseX, mouseY, 0, 100));
  coinGif.show();
}

void nextWave() {
  if (mobs.size() == 0) {
    wave++;
    for (int i = 0; i < wave; i++) {
      mobs.add(new Mob(-i*50, height/2, 50, 1, 1));
    }
  }
}

void mobAct() {
  for (int i = 0; i < mobs.size(); i++) {
    exampleMob = mobs.get(i);
    exampleMob.act();
    if (exampleMob.hp == 0) {
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
    if (exampleBullet.hp == 0) {
      bullets.remove(i);
      i--;
    }
  }
}
