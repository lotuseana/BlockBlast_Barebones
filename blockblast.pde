public final int NUM_ROWS=8;
public final int NUM_COLS = 8;
public tile[][] tiles;
public ArrayList<playableBlock> pieces = new ArrayList<playableBlock>();
public ArrayList<blockVisual> tilesForVisual = new ArrayList<blockVisual>();
public int randInPieces;
public int hoverRow=0;
public int hoverCol=0;
public playableBlock currBlock;
void setup() {
  size(500, 600);
  tiles = new tile[NUM_ROWS][NUM_COLS];
  for (int i =0; i<tiles.length; i++) {
    for (int j = 0; j<tiles[i].length; j++) {
      tiles[i][j] = new tile(i, j);
    }
  }
  initializePieces();
}
public void draw() {
  background(0);
  drawGrid();
  displayPlayingBlock();
  checkForWin();
}
public void drawGrid() {
  for (int i =0; i<tiles.length; i++) {
    for (int j = 0; j<tiles[i].length; j++) {
      tiles[i][j].drawTile();
    }
  }
}
public void initializePieces() {
  pieces.add(new playableBlock("1111", 1, 4));
  pieces.add(new playableBlock("1111", 4, 1));

  pieces.add(new playableBlock("1111", 2, 2));

  pieces.add(new playableBlock("011110", 2, 3));
  pieces.add(new playableBlock("110011", 2, 3));

  pieces.add(new playableBlock("101011", 3, 2));
  pieces.add(new playableBlock("010111", 3, 2));

  pieces.add(new playableBlock("111010", 2, 3));
  pieces.add(new playableBlock("010111", 2, 3));

  randInPieces = (int)(Math.random()*pieces.size());
}

public void displayPlayingBlock() {
  currBlock = pieces.get(randInPieces);
  for (int i =0; i<currBlock.getRows(); i++) {
    for (int j=0; j<currBlock.getCols(); j++) {
      blockVisual tileForVisual = new blockVisual(i, j, currBlock.getShape()[i][j]);
      tilesForVisual.add(tileForVisual);
      tileForVisual.drawTile();
    }
  }
  if (mousePressed) {
    resetHighlighted();
    fill(0);
    rect(0,410,600,200);
    movePlayingBlock();
    
  }
}

public void mouseReleased(){
  placePlayingBlock();
}

public void movePlayingBlock() {
  for (int i=0; i<tiles.length; i++){
    for (int j=0; j<tiles[i].length; j++){
      if (mouseX>tiles[i][j].getMinX() && mouseX<tiles[i][j].getMaxX() && mouseY>tiles[i][j].getMinY () && mouseY<tiles[i][j].getMaxY()){
        hoverRow=i;
        hoverCol=j;
      }
    }
  }
  if (placementIsValid()){
  for (int i=0; i<currBlock.getRows();i++){
    for (int j=0; j<currBlock.getCols();j++){
      if (currBlock.getShape()[i][j] == 1){
        tiles[i+hoverRow][j+hoverCol].setHighlight(true);
      }
    }
  }
  }
  
  for (int i =0; i<tilesForVisual.size(); i++) {
    tilesForVisual.get(i).moveTile(mouseX, mouseY);
    tilesForVisual.get(i).drawTile();
  }
  
}

public boolean placementIsValid(){
  if (hoverRow<0 || hoverCol<0 || hoverRow+currBlock.getRows()>NUM_ROWS || hoverCol+currBlock.getCols()>NUM_COLS){
    return false;
  }
  for (int i=0; i<currBlock.getRows(); i++){
    for (int j=0; j<currBlock.getCols(); j++){
      if (currBlock.getShape()[i][j]==1 && tiles[i+hoverRow][j+hoverCol].getFilled()){
        return false;
      }
    }
  }
  return true;
}


public void placePlayingBlock(){
  boolean blockPlaced=false;
  for (int i=0; i<tiles.length; i++){
    for (int j=0; j<tiles[i].length;j++){
      if (tiles[i][j].getHighlighted()){
        tiles[i][j].fillTile();
        blockPlaced=true;
      }
    }
  }
  if (blockPlaced){
  randInPieces = (int)(Math.random()*pieces.size());
  tilesForVisual.clear();
  displayPlayingBlock();
  }
}

public void resetHighlighted(){
  for (int i=0; i<tiles.length; i++){
    for (int j=0; j<tiles[i].length;j++){
      tiles[i][j].setHighlight(false);
    }
  }
}

public void checkForWin(){
  for (int i=0; i<tiles.length; i++){
    boolean rowWin=true;
    for (int j=0; j<tiles[i].length; j++){
      if (!tiles[i][j].getFilled()){
        rowWin=false;
        break;
      }
    }
    if (rowWin){
      for (int j=0; j<tiles[i].length; j++){
        tiles[i][j].setFilled(false);
      }
    }
    }
   for (int i=0; i<tiles.length; i++){
    boolean colWin=true;
    for (int j=0; j<tiles[i].length; j++){
      if (!tiles[j][i].getFilled()){
        colWin=false;
        break;
      }
    }
    if (colWin){
      for (int j=0; j<tiles[i].length; j++){
        tiles[j][i].setFilled(false);
      }
    }
    }
    
  }
