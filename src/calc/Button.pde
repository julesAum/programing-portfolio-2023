class Button {

  float x, y, w, h;
  color c1, c2;
  String val;
  boolean on;


  Button (float tempX, float tempY, float tempW, float tempH, String tempVal, color tempC1, color tempC2) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    c1 = tempC1;
    c2 = tempC2;
    on = false;
  }


  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    noStroke();
    rect(x, y, w, h, 5);
    fill(0);
    text(val, x+21, y+10);
  }


  void hover(int mx, int my) {
    on = (mx>x && mx<x+w && my>y && my<y+h);
  }
}
