public class blockVisual extends tile {
  public blockVisual(int i, int j, int filled) {
    super(i, j, filled);
  }
  public void drawTile() {
      if (isFilled) {
      fill(255, 0, 0);
      rect(x, y, width, height);
    }
  }
  public void moveTile(int myX, int myY){
    x = col*width + myX;
    y = row*height + myY;
  }
}
