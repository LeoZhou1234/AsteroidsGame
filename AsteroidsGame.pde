Ship ship;
ArrayList<Asteroid> asteroids;
ArrayList<Bullet> bullets;
Star[] stars;
boolean accelerating;
boolean turningLeft;
boolean turningRight;
boolean hyperjump;
boolean shootCooldown;

Boolean winState;
boolean started = false;

int ammo;
int health;

void putData() {
  textAlign(LEFT);
  textSize(10);
  text("px: " + ship.getMyCenterX(), 5, 10);
  text("py: " + ship.getMyCenterY(), 5, 20);
  text("vx: " + ship.getMyXspeed(), 5, 30);
  text("vy: " + ship.getMyYspeed(), 5, 40);
  text("dir: " + (ship.getMyPointDirection()%360), 5, 50);
  text("fps: " + frameRate, 5, 60);
  textSize(20);
  text("health: " + health + "/5", 5, height/2);
  text("ammo: " + ammo + "/30", 5, height/2+20);
}

void setup() {
  size(600, 600);
  ship = new Ship();
  asteroids = new ArrayList<Asteroid>();
  bullets = new ArrayList<Bullet>();
  stars = new Star[100];
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  
  for (int i = 0; i < 10; i++) {
    asteroids.add(new Asteroid());
  }
  
  accelerating = false;
  turningLeft = false;
  turningRight = false;
  hyperjump = false;
  shootCooldown = false;

  winState = null;
  
  ammo = 30;
  health = 5;

}

void draw() {
  if (started) {
    if (winState == null) {
      if (health <= 0 || (ammo < 0 && asteroids.size() != 0)) {
        winState = false;
        ammo = 0;
      }
      else if (asteroids.size() == 0 || (ammo == 0 && asteroids.size() == 0)) winState = true;
    
      if (!hyperjump) {
        background(0);
        double turnspeed = (hyperjump ? 1 : 5);
        if (accelerating) ship.accelerate(0.1);
        if (turningRight) ship.turn(-turnspeed);
        if (turningLeft) ship.turn(turnspeed);
        
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
            health--;
            continue;
          }
          for (int j = 0; j < bullets.size(); j++) {
            float bx = (float)bullets.get(j).getMyCenterX();
            float by = (float)bullets.get(j).getMyCenterY();
            if (dist(bx, by, ax, ay) <= avgRadius + 5) {
              asteroids.remove(i);
              bullets.remove(j);
              i--;
              j--;
              continue;
            }
          }
        }  
        for (int i = 0; i < bullets.size(); i++) {
          if (bullets.get(i).checkBounds()) {
            bullets.remove(i);
            i--;
            continue;
          }
          bullets.get(i).move();
          bullets.get(i).show();
        }
        ship.move();
        ship.show(accelerating);
        putData();
      } else {
        fill(0, 0, 0, 75);
        rect(0, 0, width, height);
      }
    } else {
      textAlign(CENTER);
      textSize(50);
      if (winState == true) {
        text("You Win!", width/2, height/2);
      }
      if (winState == false) {
        noLoop();
        if (health == 0) ship.show(false, true);
        fill(255);
        text("You Lose!", width/2, height/2);
      }
    }
  } else {
    background(0);
    textAlign(CENTER);
    textSize(50);
    text("Press E to Start",  width/2, height/2); 
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
  else if (key == ' ') {
    if (ammo == 0) ammo--;
    if (!shootCooldown && ammo > 0) {
      bullets.add(new Bullet(ship));
      ammo--;
    }
    shootCooldown = true;
  }
  else if (key == 'f') {
    hyperjump = true;
  }
  else if (key == 'e') {
    started = true;
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
  else if (key == ' ') {
    shootCooldown = false;
  }
  else if (key == 'f') {
    ship.hyperjump();
    hyperjump = false;
  }
} 
