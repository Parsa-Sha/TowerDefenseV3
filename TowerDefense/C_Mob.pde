//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float hp, sp, x, y, vx, vy, s;

  Mob(float X, float Y, float S, float Health, float Speed) {
    s = S;
    hp = Health;
    sp = Speed;
    x = X;
    y = Y;
    vx = 1 * sp;
    vy = 0 * sp;
  }

  void act() {
    advance();
    turn();
    display();
    damage();
  }

  void advance() {
    x += vx;
    y += vy;
  }

  void turn() {
    for (int i = 0; i < nodes.length; i++) {
      exampleNode = nodes[i];
      if (dist(exampleNode.x, exampleNode.y, x, y) < 2) {
        vx = exampleNode.vx * sp;
        vy = exampleNode.vy * sp;
      }
    }
    
    for (int i = 0; i < bullets.size(); i++) {
      exampleBullet = bullets.get(i);
      if (dist(x, y, exampleBullet.x, exampleBullet.y) < (s/2) + (exampleBullet.s/2)) {
        hp = 0;
        exampleBullet.hp = 0;
      }
    }
  }

  void display() {
    image(mobimg[difficulty], x, y, s, s);
  }

  void damage() {
    if (x > width) { // If reached the end, lower lives + destroy mob
      lives--;
      hp = 0;
    }
  }
}
