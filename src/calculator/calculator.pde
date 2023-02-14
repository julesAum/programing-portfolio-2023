Button[] numButtons = new Button[10];
Button[] opButtons = new Button[6];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(280, 420);
  numButtons[1] = new Button(40, 200, 50, 50, '1');
  numButtons[2] = new Button(100, 200, 50, 50, '2');
  numButtons[3] = new Button(160, 200, 50, 50, '3');
  numButtons[4] = new Button(40, 260, 50, 50, '4');
  numButtons[5] = new Button(100, 260, 50, 50, '5');
  numButtons[6] = new Button(160, 260, 50, 50, '6');
  numButtons[7] = new Button(40, 320, 50, 50, '7');
  numButtons[8] = new Button(100, 320, 50, 50, '8');
  numButtons[9] = new Button(160, 320, 50, 50, '9');
  numButtons[0] = new Button(40, 380, 50, 50, '0');
  opButtons[0] = new Button(100, 380, 50, 50, '=');
  opButtons[1] = new Button(160, 380, 50, 50, 'c');
  opButtons[2] = new Button(40, 200, 50, 50, '+');
  opButtons[3] = new Button(100, 200, 50, 50, '-');
  opButtons[4] = new Button(160, 200, 50, 50, 'x');
  opButtons[5] = new Button(220, 380, 50, 50, '/');
}

void draw() {
  background(88);
  updateDisplay();
  fill(#813535);
  rect(160, 380, 180, 60, 10);
  rect(220, 280, 60, 230, 10);
  stroke(#813535);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void mousePressed() {
}

void updateDisplay() {
  rectMode(CENTER);
  rect(width/2, 60, width-20, 100, 10);
  fill(255);
  text(dVal, width-40, 100);
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      dVal = str(numButtons[i].val);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'c') {
      dVal = "0.0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      left = true;
      op = ' ';
    } else if (opButtons[i].on) {
      dVal = str(opButtons[i].on);
    }
  }
  println("L:" + " Op:" + op + " R:" + r + " Result:" + result + "Left:" + left);
}



void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  }
}
