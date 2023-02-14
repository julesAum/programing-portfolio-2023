class Button {
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean on;

  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(128);
    c2 = color(200);
    on = false;
  }

  void display() {
    rectMode(CENTER);
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h, 5);
    textAlign(CENTER);
    textSize(32);
    fill(0);
    if (val == 'C') {
      textSize(16);
      text("clear", x, y+10);
    } else if (val =='s') {
      textSize(16);
      text("", x, y+10);
    } else {
      text(val, x, y+10);
    }
  }

  void hover(int mx, int my) {
    on = (mx>x-w/2 && mx<x+w/2 && my>y-h/2 && my<y+h/2);
  }
}
