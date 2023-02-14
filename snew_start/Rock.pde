class Rock {
  int x, y, diam, speed;
  PImage rock;

  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(60, 100));
    speed = int(random(3, 10));
    rock = loadImage("plane2.png");
  }

  void display() {
    imageMode(CENTER);
    rock.resize(diam, diam);
    image(rock, x, y);
  }

  void move () {
    y += speed;
  }

  boolean reachBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
