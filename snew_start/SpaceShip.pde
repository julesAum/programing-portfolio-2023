class SpaceShip {
  int x, y, w, ammo,health;
  PImage ship;

  SpaceShip() {
    x = 0;
    y = 0;
    w = 90;
    ammo = 100;
    health = 100;
    ship = loadImage("plane.png");
  }

  void display() {
    ship.resize(90, 90);
    imageMode(CENTER);
    image(ship, x, y);
  }

  void move (int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (ammo>0) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<30) {
      return true;
    } else {
      return false;
    }
  }
}
