class Generator {

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
    
      
      
    
    
  void gRivers(Map map) {
    int mapX = MAP_WIDTH / (TILE_SIZE * 2);
    int mapY = MAP_HEIGHT / (TILE_SIZE * 2);
    while (true) {
      int startX = (int) random(mapX);
      int startY = (int) random(mapY);
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
      if (random(100) < 50) {
        break;
      }
    }
    for (int y=0; y<mapY; y++) {
      for (int x=0; x<mapX; x++) {
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

  void gMountains(Map map) {
  }

  void gRoads(Map map) {
  }
}

