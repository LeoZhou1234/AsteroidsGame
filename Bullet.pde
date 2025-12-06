public class Bullet extends Floater {
  public Bullet(Ship ship) {
    myXspeed = ship.getMyXspeed();
    myYspeed = ship.getMyYspeed();
    myCenterX = ship.getMyCenterX();
    myCenterY = ship.getMyCenterY();
    myPointDirection = ship.getMyPointDirection();
    accelerate(15);
  }
  
  public void show() {
    fill(255, 255, 0);
    stroke(255, 255, 0);
    ellipse((float)myCenterX, (float)myCenterY, 2.5, 2.5);
  }
  
  public void move () {      
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
  }
  
  public boolean checkBounds() {
      return (myCenterX > width || myCenterX < 0 || myCenterY > height || myCenterY < 0);
  }
  
  public double getMyCenterX() { return myCenterX; }
  public double getMyCenterY() { return myCenterY; }
}
