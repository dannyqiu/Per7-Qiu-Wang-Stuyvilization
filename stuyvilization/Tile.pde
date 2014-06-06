class Tile {

  Object item;
  int centerX;
  int centerY;
  ArrayList<Tile> neighbors;
  color tileColor;
  int value;

  public Tile (float x, float y) {
    centerX = round(x * TILE_SIZE * 2);
    centerY = round(y * TILE_SIZE * 2);
    tileColor = #FFDC00;
    value = 5;
  }

  void setPointer(Object item) {
    this.item = item;
  }

  void setNeighbors(ArrayList<Tile> neighbors) {
    this.neighbors = neighbors;
  }

  void setColor(color c) {
    tileColor = c;
  }

  ArrayList<Tile> getNeighbors() {
    return neighbors;
  }

  color getColor() {
    return tileColor;
  }

  int getValue() {
    return value;
  }

  void draw() {
    int offsetX = round(TILE_SIZE / 2 * sqrt(3));
    int offsetY = TILE_SIZE / 2;
    beginShape();
    //noStroke();
    fill(tileColor);
    vertex(centerX, centerY + offsetY * 2);
    vertex(centerX + offsetX, centerY + offsetY);
    vertex(centerX + offsetX, centerY - offsetY);
    vertex(centerX, centerY - offsetY * 2);
    vertex(centerX - offsetX, centerY - offsetY);
    vertex(centerX - offsetX, centerY + offsetY);
    endShape(CLOSE);
    //fill(0, 0, 0);
    //text(centerX+","+centerY, centerX, centerY);
  }
}

