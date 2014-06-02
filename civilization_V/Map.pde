class Map {
  Tile[][] map;
  int width;
  int height;
  
  public Map() {
    width = MAP_WIDTH / TILE_SIZE;
    height = MAP_HEIGHT / TILE_SIZE;
    map = new Tile[width][height];
    for (int x=0; x<width; x++) {
      for (int y=0; y<height; y++) {
        if (y % 2 == 0) {
          map[x][y] = new Tile(x, y);
        }
        else {
          map[x][y] = new Tile(x+.5, y);
        }
      }
    }
  }
  
  Tile[][] getMap() {
    return map;
  }
  
  void draw() {
    for (int w=0; w<width; w++) {
      for (int h=0; h<height; h++) {
        map[w][h].draw();
      }
    }
  }
}
