class PowerUp {
  int x, y, diam, speed;
//  PImage rock;

  PowerUp() {
    x = int(random(width));
    y = -100;
    diam = int(random(60, 100));
    speed = int(random(3, 10));
 //   rock = loadImage("plane2.png");
  }

  void display() {
    fill(128);
    ellipse(x,y,diam,diam);
    //imageMode(CENTER);
    //rock.resize(diam, diam);
    //image(rock, x, y);
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
   boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<30) {
      return true;
    } else {
      return false;
    }
  }
}
