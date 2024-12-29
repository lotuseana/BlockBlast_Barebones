public class playableBlock{
  private int[][] pieceShape;
  private int nRow, nCol;
  public playableBlock(String num, int rows, int cols){
    nRow = rows;
    nCol = cols;
    pieceShape = new int[nRow][nCol];
    for (int i = 0; i<nRow; i++){
      for (int j = 0; j<nCol; j++){
        pieceShape[i][j] = Integer.parseInt(num.substring(0,1));
        num=num.substring(1,num.length());
      }
    }
    
  }
  public int[][] getShape(){
    return pieceShape;
  }
  public void printShape(){
    for (int i = 0; i<nRow; i++){
      for (int j = 0; j<nCol; j++){
        System.out.print(pieceShape[i][j]);
      }
      System.out.println();
    }
    System.out.println(".");
  }
  public int getRows(){
    return nRow;
  }
  public int getCols(){
    return nCol;
  }
}
