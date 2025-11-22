Ship ship;
ArrayList<Asteroid> asteroids;
Star[] stars;
boolean accelerating = false;
boolean turningLeft = false;
boolean turningRight = false;
boolean hyperjump = false;

void putData() {
  textSize(10);
  text("px: " + ship.getMyCenterX(), 5, 10);
  text("py: " + ship.getMyCenterY(), 5, 20);
  text("vx: " + ship.getMyXspeed(), 5, 30);
  text("vy: " + ship.getMyYspeed(), 5, 40);
  text("dir: " + (ship.getMyPointDirection()%360), 5, 50);
  text("fps: " + frameRate, 5, 60);
}

void setup() {
  size(600, 600);
  ship = new Ship();
  asteroids = new ArrayList<Asteroid>();
  stars = new Star[100];
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  
  for (int i = 0; i < 10; i++) {
    asteroids.add(new Asteroid());
  }
}

void draw() {
  double turnspeed = (hyperjump ? 1 : 5);
  
  if (accelerating) ship.accelerate(0.1);
  if (turningRight) ship.turn(-turnspeed);
  if (turningLeft) ship.turn(turnspeed);
  //if (asteroids.size() < 10) asteroids.add(new Asteroid()); //MAKE ASTEROIDS SPAWN AT EDGE OF SCREEN
  
  if (!hyperjump) {
    background(0);
    
    for (int i = 0; i < stars.length; i++) {
      stars[i].show();
    }
    
    for (int i = 0; i < asteroids.size(); i++) {
      asteroids.get(i).move();
      asteroids.get(i).show();
      
      float avgRadius = (float)asteroids.get(i).getAvgRadius();
      float sx = (float)ship.getMyCenterX();
      float sy = (float)ship.getMyCenterY();
      float ax = (float)asteroids.get(i).getMyCenterX();
      float ay = (float)asteroids.get(i).getMyCenterY();
      if (dist(sx, sy, ax, ay) <= avgRadius + 7.5) {
        asteroids.remove(i);
        i--;
      }
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
