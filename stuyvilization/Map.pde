class Map {

  Tile[][] map;
  int width;
  int height;

  public Map() {
    width = round(MAP_WIDTH / (TILE_SIZE * 2));
    height = round(MAP_WIDTH / (TILE_SIZE * 2 + (TILE_SIZE / 2 * sqrt(3)) - 1));
    map = new Tile[width][height];
    for (int y=0; y<height; y++) {
      if (y % 2 == 0) {
        for (int x=0; x<width; x++) {
          map[x][y] = new Tile(x+.5, y+.5);
        }
      } else {
        for (int x=0; x<width; x++) {
          map[x][y] = new Tile(x+1, y+.5);
        }
      }
    }
    for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
        map[x][y].setNeighbors(getTileNeighbors(x, y)); // Defines the neighbors of the tiles after the tiles are all created
      }
    }
  }

  ArrayList<Tile> getTileNeighbors(int x, int y) {
    ArrayList<Tile> neighbors = new ArrayList<Tile>();
    if (y % 2 == 0) {
      try {
        neighbors.add(map[x-1][y-1]);
      } 
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x-1][y]);
      } 
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x-1][y+1]);
      } 
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x][y-1]);
      } 
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x][y+1]);
      } 
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x+1][y]);
      } 
      catch (Exception e) {
      }
    } else {
      try {
        neighbors.add(map[x][y-1]);
      } 
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x+1][y-1]);
      }
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x+1][y]);
      } 
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x+1][y+1]);
      } 
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x][y+1]);
      } 
      catch (Exception e) {
      }
      try {
        neighbors.add(map[x-1][y]);
      } 
      catch (Exception e) {
      }
    }
    return neighbors;
  }

  Tile[][] getMap() {
    return map;
  }
  
  int getWidth() {
    return width;
  }
  
  int getHeight() {
    return height;
  }

  Tile getNearestTile(int xCoor, int yCoor) {
    int y = round(yCoor / TILE_SIZE / 2);
    int x;
    if (y % 2 == 0) {
      x = xCoor / 2 / TILE_SIZE;
    } else {
      x = (xCoor - TILE_SIZE) / 2 / TILE_SIZE;
    }
    return map[x][y];
  }

  void draw() {
    for (int w=0; w<width; w++) {
      for (int h=0; h<height; h++) {
        map[w][h].draw();
      }
    }
  }
}

