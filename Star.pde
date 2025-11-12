class Star {
  private double x, y, size;
  private int rgb;
  public Star() {
    x = random(0, width);
    y = random(0, height);
    rgb = color((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
    size = random(1, 2.5);
  }
  
  public double random(double lowerBound, double upperBound) {
    return (Math.random()*(upperBound-lowerBound)) + lowerBound;
  }
   
  public void show() {
    fill(rgb);
    stroke(rgb);
    ellipse((float)x, (float)y, (float)size, (float)size);
  }
}
