int x, y;

void setup() {
  size(500, 500);
  x=width/2;
  y=height/2;
  background(255);
}

void draw() {
  stroke(0);
  strokeWeight(3);
  if(x>=width){
    x=width/2;
  }
  if (keyPressed) {
    if (key == 'w' || key =='W' ) {
      moveUp(2);
    } else if (key == 'a' || key =='A' ) {
      moveLeft(2);
    } else if (key == 'd' || key =='D' ) {
      moveRight(2);
    } else if (key == 's' || key =='S' ) {
      moveDown(2);
    }
  }
}

void mousePressed() {
  saveFrame("image-######.png");
}

void keyPressed() {
  if (key == CODED);
  {
    if (keyCode == UP) {
      moveUp(5);
    } else if (keyCode == RIGHT) {
      moveRight(5);
    } else if (keyCode == LEFT) {
      moveLeft(5);
    } else if (keyCode == DOWN) {
      moveDown(5);
    }
  }
}
void drawName() {
  moveRight(100);
  moveDown(100);
  moveLeft(100);
  moveUp(100);
}
void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}


void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}
