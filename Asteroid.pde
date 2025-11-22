public class Asteroid extends Floater {
  private double turnSpeed;
  private double avgRadius;
  
  public Asteroid() {
    corners = 8;
    xCorners = new int[8];
    yCorners = new int[8];
    
    xCorners[0] = randomInt(10, 15);
    xCorners[1] = randomInt(10, 15);
    xCorners[2] = randomInt(10, 15);
    xCorners[3] = randomInt(-5, 5);
    xCorners[4] = -randomInt(10, 15);
    xCorners[5] = -randomInt(10, 15);
    xCorners[6] = -randomInt(10, 15);
    xCorners[7] = randomInt(-5, 5);
    
    yCorners[0] = randomInt(10, 15);
    yCorners[1] = randomInt(-5, 5);
    yCorners[2] = -randomInt(10, 15);
    yCorners[3] = -randomInt(10, 15);
    yCorners[4] = -randomInt(10, 15);
    yCorners[5] = randomInt(-5, 5);
    yCorners[6] = randomInt(10, 15);
    yCorners[7] = randomInt(10, 15);
    
    double sum = 0;
    for (int i = 0; i < corners; i++) {
      sum += Math.sqrt(Math.pow(xCorners[i], 2) + Math.pow(yCorners[i], 2));
    }
    avgRadius = sum/8;
    
    myColor = color(150, 150, 150);
    myCenterX = randomDouble(0, width);
    myCenterY = randomDouble(0, height);
    myXspeed = randomDouble(-3, 3);
    myYspeed = randomDouble(-3, 3);
    myPointDirection = randomDouble(0, 360);
    turnSpeed = randomDouble(-2.5, 2.5);
  }
  
  public void move() {
    turn(turnSpeed);
    super.move();
  }
  
  public double getMyCenterX() { return myCenterX; }
  public double getMyCenterY() { return myCenterY; }
  public double getAvgRadius() { return avgRadius; }
   
  public int randomInt(double lowerBound, double upperBound) {
    return (int)((Math.random()*(upperBound-lowerBound+1)) + lowerBound);
  }
  
  public double randomDouble(double lowerBound, double upperBound) {
    return (Math.random()*(upperBound-lowerBound)) + lowerBound;
  }
}
