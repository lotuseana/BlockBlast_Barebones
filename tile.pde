public class tile{
  protected int row, col, x, y, width, height;
  protected boolean isFilled, isHighlighted;
  public tile(int i, int j){
    row = i;
    col = j;
    width = 400/NUM_COLS;
    height = 400/NUM_ROWS;
    x = col*width + 50;
    y = row*height + 10;
    isFilled=false;
  }
  public tile(int i, int j, int filled){
    row = i;
    col = j;
    width = 35;
    height = 35;
    x = col*width + 200;
    y = row*height + 450;
    if (filled==1){
      isFilled=true;
    } else{
      isFilled=false;
    }
  }
  public void drawTile(){
    if (isFilled){
      fill (255,0,0);
    }else{
    fill(255);}
    rect(x,y,width,height);
  }
  public void setHighlight(boolean e){
    if (e){
    fill(0,255,0);
    rect(x,y,width,height);
    isHighlighted=true;}
    else{
      isHighlighted=false;
    }
  }
  public void setFilled(boolean e){
    isFilled=e;
  }
  public void fillTile(){
    isFilled=true;
  }
  public boolean getFilled(){
    return isFilled;
  }
  public boolean getHighlighted(){
    return isHighlighted;
  }
  public int getMinX(){
    return x;
  }
  public int getMaxX(){
    return x+width;
  }
  public int getMinY(){
    return y;
  }
  public int getMaxY(){
    return y+height;
  }
  
}
