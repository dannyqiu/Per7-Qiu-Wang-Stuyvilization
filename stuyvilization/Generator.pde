class Generator {

  void generateMap(Map map) {
    gLakes(map);
    gRivers(map);
    gMountains(map);
    gRoads(map);
  }

  void gRivers(Map map) {
    int startX = (int) random(MAP_WIDTH / (TILE_SIZE * 2));
    int startY = (int) random(MAP_HEIGHT / (TILE_SIZE * 2));
    Tile start = map.getMap()[startX][startY];
    while (random(100) < 95) {
      start.setColor(#0074D9);
      ArrayList<Tile> neighbors = start.getNeighbors();
      int iter = 0;
      while (hex(start.getColor()).equals("FF0074D9") && iter < 6) {
        start = neighbors.get((int) random(neighbors.size()));
        iter++;
      }
    }
  }

  void gMountains(Map map) {
  }

  void gLakes(Map map) {
  }

  void gRoads(Map map) {
  }
}

