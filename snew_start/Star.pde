class Star {
  int x, y, diam, speed;

  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(1, 3));
    speed = int(random(2, 5));
  }

  void display() {
    fill(255);
    circle(x, y, diam);
  }

  void move () {
    if (y>height) {
      y = 0;
    } else {
      y += speed;
    }
  }

  boolean reachBottom() {
    return true;
  }
}
