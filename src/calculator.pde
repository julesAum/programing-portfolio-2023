



Button[] numButtons = new Button[10];
Button[] opButtons = new Button[11];
String dVal = "0";
String op = "";
boolean left = true;
float r = 0.0;
float l= 0.0 ;
float result = 0.0;

void setup() {
  size(255, 420);
  numButtons[1] = new Button(10, 180, 50, 50, "1", color (203, 242, 207, 95), color (0, 217, 185, 85));
  numButtons[2] = new Button(70, 180, 50, 50, "2", color (203, 242, 207, 95), color (0, 217, 185, 85));
  numButtons[3] = new Button(130, 180, 50, 50, "3", color (203, 242, 207, 95), color (0, 217, 185, 85));
  numButtons[4] = new Button(10, 240, 50, 50, "4", color (203, 242, 207, 95), color (0, 217, 185, 85));
  numButtons[5] = new Button(70, 240, 50, 50, "5", color (203, 242, 207, 95), color (0, 217, 185, 85));
  numButtons[6] = new Button(130, 240, 50, 50, "6", color (203, 242, 207, 95), color (0, 217, 185, 85));
  numButtons[7] = new Button(10, 300, 50, 50, "7", color (203, 242, 207, 95), color (0, 217, 185, 85));
  numButtons[8] = new Button(70, 300, 50, 50, "8", color (203, 242, 207, 95), color (0, 217, 185, 85));
  numButtons[9] = new Button(130, 300, 50, 50, "9", color (203, 242, 207, 95), color (0, 217, 185, 85));
  numButtons[0] = new Button(10, 360, 50, 50, "0", color (203, 242, 207, 95), color (0, 217, 185, 85));
  opButtons[0] = new Button(10, 120, 50, 50, "+", color (203, 242, 207, 95), color (0, 217, 185, 85));
  opButtons[1] = new Button(70, 120, 50, 50, "-", color (203, 242, 207, 95), color (0, 217, 185, 85));
  opButtons[2] = new Button(130, 120, 50, 50, "x", color (203, 242, 207, 95), color (0, 217, 185, 85));
  opButtons[3] = new Button(190, 120, 50, 50, "÷", color (203, 242, 207, 95), color (0, 217, 185, 85));
  opButtons[4] = new Button (70, 360, 80, 50, "CLEAR", color (203, 242, 207, 95), color (0, 217, 185, 85));
  opButtons[5] = new Button(190, 180, 50, 50, "π", color (203, 242, 207, 95), color (0, 217, 185, 85));
  opButtons[6] = new Button (190, 240, 50, 50, "x²", color (203, 242, 207, 95), color (0, 217, 185, 85)) ;
  opButtons[7] = new Button (190, 65, 50, 50, "%", color (203, 242, 207, 95), color (0, 217, 185, 85)) ;
  opButtons[8] = new Button (190, 9, 50, 50, "±", color (203, 242, 207, 95), color (0, 217, 185, 85)) ;
  opButtons[9] = new Button (190, 300, 50, 50, "√", color (203, 242, 207, 95), color (0, 217, 185, 85)) ;
  opButtons[10] = new Button (160, 360, 80, 50, "ENTER", color (203, 242, 207, 95), color (0, 217, 185, 85)) ;
}

void draw() {
  background(#E3DC05);
  fill(200);
  rect(65, 355, 180, 60, 10);
  rect(185, 5, 60, 400, 10);
  rect(65, 115, 180, 60, 10);

  updateDisplay();
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
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.equals("0")) {
      dVal = numButtons[i].val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    } else if (numButtons[i].on) {
      dVal = dVal + numButtons[i].val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    }
  }
  for (int i=0; i<opButtons. length; i++) {
    if (opButtons[i].on && opButtons[i].val.equals ("CLEAR")) {
      dVal = "0";
      op = "";
      left = true;
      r = 0.0;
      l = 0.0 ;
      result = 0.0;
    } else if (opButtons[i].on && opButtons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val.equals("x")) {
      handleEvent("x", false);
    } else if (opButtons[i].on && opButtons[i].val.equals("÷")) {
      handleEvent("÷", false);
    } else if (opButtons[i]. on && opButtons[i].val.equals ("ENTER")) {
      performCalc();
    } else if (opButtons[i]. on && opButtons[i].val.equals ("π")) {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButtons[i]. on && opButtons[i].val.equals ("±")) {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = l*-1;
        dVal = str(r);
      }
    } else if (opButtons[i]. on && opButtons[i].val.equals ("x²")) {
      if (left) {
        l = l*l;
        dVal = str(l);
      } else {
        r = r*r;
        dVal = str(r);
      }
    } else if (opButtons[i]. on && opButtons[i].val.equals ("%")) {
      if (left) {
        l = l*0.01;
        dVal = str(l);
      } else {
        r = r*0.01;
        dVal = str(r);
      }
    } else if (opButtons[i]. on && opButtons[i].val.equals ("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    }
  }
  println("L:" + l + " Op:" + op + " R:" + r + " Result:" + result + " Left:" + left );
}

void updateDisplay() {
  fill(200);
  rect(10, 10, 170, 100, 10);
  fill(0);
  text(dVal, width-240, 40);
}

void keyPressed() {
  println("KEY:" + key + " keyCode:" + keyCode);
  if (key =='0') {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("x", false);
  } else if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 27 || key == 'C') {
    handleEvent ("C", false) ;
  } else if (key == 10) { // (key == CODED)
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  }
}
void handleEvent (String val, boolean num) {
  if (left & num) { // Left Number
    if (dVal.equals("0") || result == 1) {
      dVal = (val);
      l = float (dVal);
    } else {
      dVal += (val) ;
      l = float (dVal);
    }
  } else if (!left && num) {
    if (val.equals ("0") || result == 1) {
      dVal = (val) ;
      r = float (dVal);
    } else {
      dVal += (val) ;
      r = float (dVal);
    }
  } else if (val.equals ("C")) {
    dVal = "g";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = " ";
  } else if (val.equals("+")) {
    left = false;
    op = "+";
    dVal = "0";
  } else if (val.equals("-")) {
    left = false;
    op = "-";
    dVal = "0";
  } else if (val.equals("x")) {
    left = false;
    op = "x";
    dVal = "0";
  } else if (val.equals("÷")) {
    left = false;
    op = "÷";
    dVal = "0";
  }
}


void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
