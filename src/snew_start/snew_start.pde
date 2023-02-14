import processing.sound.*;
SoundFile laser;
SpaceShip s1;
Timer rockTimer,puTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[500];
int score, level;
boolean play;

void setup() {
  size(800, 800);
  laser = new SoundFile(this, "laser.wav");
  s1 = new SpaceShip();
  rockTimer = new Timer(500);
  rockTimer.start();
  puTimer = new Timer(10000);
  puTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    //rander stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();
    
    //ading PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      //println("Rocks:" + rocks.size());
    }
    //display rocks
    for (int i = 0; i < powerups.size(); i ++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        s1.health -= 50;
        powerups.remove(pu);
      }
      if (pu.reachBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }
    //ading rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println("Rocks:" + rocks.size());
    }
    //display rocks
    for (int i = 0; i < rocks.size(); i ++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health -= 50;
        rocks.remove(r);
      }
      if (r.reachBottom()) {
        rocks.remove(r);
      } else {
        r.display();
        r.move();
      }
    }
    //display lasers
    for (int i = 0; i < lasers.size(); i ++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j ++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          rocks.remove(r);
          score += 1;
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }
    infoPanel();
    s1.display();
    s1.move(mouseX, mouseY);
    if (s1.health <10) {
      gameOver();
    }
  }
}

void mousePressed() {
  lasers.add(new Laser(s1.x, s1.y));
  laser.play();
}

void infoPanel() {
  fill(128, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  text("Score:" + score + " | level", 20, 40);
}
void startScreen() {
  background(0);
  fill(0, 0, 250);
  textAlign(CENTER);
  text("Press any key to begin...", width/2, height/2);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(0, 0, 250);
  textAlign(CENTER);
  text("Game over!", width/2, height/2);
  noLoop();
}
