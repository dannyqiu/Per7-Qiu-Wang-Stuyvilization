class Generator {

  int rivers = (int) random(4) + 1;
  int mountains = (int) random(3) + 1;

  void generateMap(Map map) {
    gMountains(map);
    gRivers(map);
    gRoads(map);
    gStartUnit(map);
  }

  void gStartUnit(Map map){
    int mapX = (int) random(MAP_WIDTH / (TILE_SIZE * 4));
    int mapY = (int) random(MAP_HEIGHT / (TILE_SIZE * 2));
    Tile start = map.getMap()[startX][startY];
    while (hex (start.getColor ()).equals(hex(WATER_COLOR)))
    mapX = MAP_WIDTH / (TILE_SIZE * 4);
    mapY = MAP_HEIGHT / (TILE_SIZE * 2);
    start = map.getMap()[startX][startY];}
    
  void gMountains(Map map) {
    while (mountains > 0) {
      int startX = (int) random(map.getWidth());
      int startY = (int) random(map.getHeight());
      Tile start = map.getMap()[startX][startY];
      for (Tile t : start.getNeighbors ()) {
        if (random(100) < 70 && hex(t.getColor()).equals(hex(LAND_COLOR))) {
          t.setColor(MOUNTAIN_COLOR);
          for (Tile end : t.getNeighbors ()) {
            if (random(100) < 70 && hex(end.getColor()).equals(hex(LAND_COLOR))) {
              end.setColor(MOUNTAIN_COLOR);
            }
          }
        }
      }
      mountains--;
    }
  }

  void gRivers(Map map) {
    while (rivers > 0) {
      int startX = (int) random(map.getWidth());
      int startY = (int) random(map.getHeight());
      Tile start = map.getMap()[startX][startY];
      while (random (100) < 95) {
        start.setColor(WATER_COLOR);
        ArrayList<Tile> neighbors = start.getNeighbors();
        int iter = 0;
        while (hex (start.getColor ()).equals(hex(WATER_COLOR)) && iter < 6) {
          start = neighbors.get((int) random(neighbors.size()));
          iter++;
        }
      }
      rivers--;
    }
    for (int y=0; y<map.getHeight (); y++) {
      for (int x=0; x<map.getHeight (); x++) {
        boolean allWater = true;
        for (Tile t : map.getMap ()[x][y].getNeighbors()) {
          if (!hex(t.getColor()).equals(hex(WATER_COLOR))) {
            allWater = false;
          }
        }
        if (allWater) {
          map.getMap()[x][y].setColor(#0074D9);
        }
      }
    }
  }

  void gRoads(Map map) {
    
  }
}

