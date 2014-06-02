class Tile {
  Object item;
  int centerX;
  int centerY;
  
  public Tile (float x, float y) {
    centerX = round(x * TILE_SIZE * 2);
    centerY = round(y * TILE_SIZE * 2);
  }
  
  void setPointer (Object item) {
    this.item = item;
  }
  
  void draw() {
    int offsetX = round(TILE_SIZE / 2 * sqrt(3));
    int offsetY = TILE_SIZE / 2;
    noFill();
    //noStroke();
    beginShape();
    vertex(centerX, centerY + offsetY * 2);
    vertex(centerX + offsetX, centerY + offsetY);
    vertex(centerX + offsetX, centerY - offsetY);
    vertex(centerX, centerY - offsetY * 2);
    vertex(centerX - offsetX, centerY - offsetY);
    vertex(centerX - offsetX, centerY + offsetY);
    endShape(CLOSE);
  }
  
}
