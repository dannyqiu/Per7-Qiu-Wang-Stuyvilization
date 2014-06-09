class Generator {

  int rivers = (int) random(10) + 1;
  int mountains = (int) random(3) + 1;
  ArrayList<Tile> path = new ArrayList<Tile>();
  boolean pathFound = false;
  MapQueue<Tile> tilesToSearch = new MapQueue<Tile>();

  void generateMap(Map map) {
    while (!pathFound) {
      /* Clearing the map of all previous generations */
      try {
        PLAYER_SETTLER.setDead(true);
        ENEMY_SETTLER.setDead(true);
        Units.clear();
        unitsSprites.clear();
      }
      catch (Exception e) {
      }
      for (int y=0; y<map.getHeight (); y++) {
        for (int x=0; x<map.getWidth (); x++) {
          map.getMap()[x][y].setColor(LAND_COLOR);
        }
      }

      gMountains(map);
      gRivers(map);
      Tile playerStart = gPlayerStartUnit(map);
      Tile enemyStart = gEnemyStartUnit(map);
      gPath(map, playerStart, enemyStart);
    }
  }

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

  void gPath(Map map, Tile start, Tile end) {
    for (int y=0; y<map.getHeight (); y++) {
      for (int x=0; x<map.getWidth (); x++) {
        map.getMap()[x][y].mapTileBefore = null;
      }
    }
    breadthSearch(start, end);
    for (Tile p : path) {
      p.setColor(PATH_COLOR);
    }
  }

  void breadthSearch(Tile start, Tile end) {
    tilesToSearch.add(start);
    while (tilesToSearch.getQueue ().size() > 0 && !pathFound) {
      Tile current = tilesToSearch.remove();
      for (Tile t : current.getNeighbors ()) {
        if (t == end) {
          t.mapTileBefore = current;
          pathFound = true;
        } else if (t.mapTileBefore == null && hex(t.getColor()).equals(hex(LAND_COLOR))) {
          t.mapTileBefore = current;
          tilesToSearch.add(t);
        }
      }
    }
    if (pathFound) {
      Tile tmp = end.mapTileBefore;
      while (tmp.mapTileBefore != null) {
        path.add(0, tmp);
        tmp = tmp.mapTileBefore;
      }
    }
  }
}

