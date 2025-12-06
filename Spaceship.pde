class Ship extends Floater {
  int[] rocketXCorners;
  int[] rocketYCorners;
  int rocketCorners;
  public Ship() {
    corners = 4;
    rocketCorners = 4;
    xCorners = new int[] {16, -8, -2, -8};
    yCorners = new int[] {0, 8, 0, -8};
    rocketXCorners = new int[] {-8, -14, -24, -14};
    rocketYCorners = new int[] {0, 4, 0, -4};
    myColor = color(255, 255, 255);
    myCenterX = width/2;
    myCenterY = height/2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = -90;
  }
  
  public void hyperjump() {
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = randomDouble(0, 360);
    myCenterX = randomDouble(0, width);
    myCenterY = randomDouble(0, height);
  }
  
 public void show(boolean accelerating) {
   show(accelerating, false);
 }
 
 public void show(boolean accelerating, boolean explode) { //Draws the floater at the current position  
  fill(myColor);   
  stroke(myColor);    
  
  if (explode) {
    fill(255, 255, 0);
    strokeWeight(10);
    stroke(255, 0, 0);
    corners = 8;
    xCorners = new int[8];
    yCorners = new int[8];
    
    xCorners[0] = randomInt(20, 40);
    xCorners[1] = randomInt(20, 40);
    xCorners[2] = randomInt(20, 40);
    xCorners[3] = randomInt(-10, 10);
    xCorners[4] = -randomInt(20, 40);
    xCorners[5] = -randomInt(20, 40);
    xCorners[6] = -randomInt(20, 40);
    xCorners[7] = randomInt(-10, 10);
    
    yCorners[0] = randomInt(20, 40);
    yCorners[1] = randomInt(-10, 10);
    yCorners[2] = -randomInt(20, 40);
    yCorners[3] = -randomInt(20, 40);
    yCorners[4] = -randomInt(20, 40);
    yCorners[5] = randomInt(-10, 10);
    yCorners[6] = randomInt(20, 40);
    yCorners[7] = randomInt(20, 40);
  }
  
  //translate the (x,y) center of the ship to the correct position
  translate((float)myCenterX, (float)myCenterY);

  //convert degrees to radians for rotate()     
  float dRadians = (float)(myPointDirection*(Math.PI/180));
  
  //rotate so that the polygon will be drawn in the correct direction
  rotate(dRadians);
  
  //draw the polygon
  beginShape();
  for (int nI = 0; nI < corners; nI++) {
    vertex(xCorners[nI], yCorners[nI]);
  }
  endShape(CLOSE);
  
  if (accelerating) {
    fill(255, 255, 0);
    stroke(255, 0, 0);
    beginShape();
    for (int nI = 0; nI < rocketCorners; nI++) {
      vertex(rocketXCorners[nI], rocketYCorners[nI]);
    }
    endShape(CLOSE);
    fill(255);
  }
  
  //"unrotate" and "untranslate" in reverse order
  rotate(-1*dRadians);
  translate(-1*(float)myCenterX, -1*(float)myCenterY);
}   

  
  public double getMyPointDirection() { return myPointDirection; }
  public double getMyXspeed() { return myXspeed; }
  public double getMyYspeed() { return myYspeed; }
  public double getMyCenterX() { return myCenterX; }
  public double getMyCenterY() { return myCenterY; }
  
  public void setMyXspeed(double speed) { myXspeed = speed; }
  public void setMyYspeed(double speed) { myYspeed = speed; }
  
  public int randomInt(double lowerBound, double upperBound) {
    return (int)((Math.random()*(upperBound-lowerBound+1)) + lowerBound);
  }
  
  public double randomDouble(double lowerBound, double upperBound) {
    return (Math.random()*(upperBound-lowerBound)) + lowerBound;
  }
}
