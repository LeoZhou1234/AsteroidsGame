class Star {
  private double x, y, size;
  private int rgb;
  public Star() {
    x = randomDouble(0, width);
    y = randomDouble(0, height);
    rgb = color(randomInt(0, 255), randomInt(0, 255), randomInt(0, 255));
    size = random(1, 2.5);
  }
  
  public double randomDouble(double lowerBound, double upperBound) {
    return (Math.random()*(upperBound-lowerBound)) + lowerBound;
  }
  
  public int randomInt(double lowerBound, double upperBound) {
    return (int)((Math.random()*(upperBound-lowerBound+1)) + lowerBound);
  }
   
  public void show() {
    fill(rgb);
    stroke(rgb);
    ellipse((float)x, (float)y, (float)size, (float)size);
  }
}
