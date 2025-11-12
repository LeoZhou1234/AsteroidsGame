Ship ship;
Star[] stars;
boolean accelerating = false;
boolean turningLeft = false;
boolean turningRight = false;
boolean hyperjump = false;
//float minFPS = 60;
//long prevTime;

void putData() {
  //if (System.currentTimeMillis() > prevTime + 1000) {
  //  //if (frameRate < minFPS) {
  //  //  prevTime = System.currentTimeMillis();
  //  //  minFPS = 60;
  //  //  minFPS = min(frameRate, minFPS);
  //  //}
  //  prevTime = System.currentTimeMillis();
  //  //minFPS = 60;
  //  minFPS = min(frameRate, minFPS);
  //}
  textSize(10);
  text("px: " + ship.getMyCenterX(), 5, 10);
  text("py: " + ship.getMyCenterY(), 5, 20);
  text("vx: " + ship.getMyXspeed(), 5, 30);
  text("vy: " + ship.getMyYspeed(), 5, 40);
  text("dir: " + (ship.getMyPointDirection()%360), 5, 50);
  text("fps: " + frameRate, 5, 60);
  //text("1% low: " + minFPS, 5, 70);
}

void setup() {
  //prevTime = System.currentTimeMillis();
  size(600, 600);
  System.out.println(displayWidth);
  System.out.println(displayHeight);
  ship = new Ship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  double turnspeed = (hyperjump ? 1 : 5);
  if (accelerating) ship.accelerate(0.1);
  if (turningRight) ship.turn(-turnspeed);
  if (turningLeft) ship.turn(turnspeed);
  if (!hyperjump) {
    background(0);
    for (int i = 0; i < stars.length; i++) {
      stars[i].show();
    }
    ship.move();
    ship.show(accelerating);
    putData();
  } else {
    fill(0, 0, 0, 75);
    rect(0, 0, width, height);
  }
}

void keyPressed() {
  if (key == 'w' || keyCode == UP) {
    accelerating = true;
  }
  else if (key == 'a' || keyCode == LEFT) {
    turningRight = true;
  }
  else if (key == 'd' || keyCode == RIGHT) {
    turningLeft = true;
  }
  else if (key == 'f') {
    hyperjump = true;
  }
}

void keyReleased() {
  if (key == 'w' || keyCode == UP) {
    accelerating = false;
  }
  else if (key == 'a' || keyCode == LEFT) {
    turningRight = false;
  }
  else if (key == 'd' || keyCode == RIGHT) {
    turningLeft = false;
  }
  else if (key == 'f') {
    ship.hyperjump();
    hyperjump = false;
  }
} 
