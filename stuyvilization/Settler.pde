class Settler extends Unit {
  public Settler(int xpos, int ypos) {
    _health = 10;
    _strength = 0;
    _movement = 2;
    _range = 0;
    _cost = 200;
    _name = "Settler";
    x = xpos;
    y = ypos;
  }

  public void CreateCapital() {
    Tile Current = game.getNearestTile(x, y);
    ArrayList<Tile> N = Current.getNeighbors();
    for (Tile x : N) {
      if (hex(x.getColor()).equals(hex(LAND_COLOR)) || hex(x.getColor()).equals(hex(MYTILE_COLOR))) {
        if (!enemy) {
          x.setColor(MYTILE_COLOR);
        } else {
          x.setColor(ENEMYTILE_COLOR);
        }
      }
    }
    if (!enemy) {
      Current.setColor(MYHOME_COLOR);
      CapitalX = x;
      CapitalY = y;
    } else {
      Current.setColor(ENEMYHOME_COLOR);
      enemyCapitalX = x;
      enemyCapitalY = y;
    }
  }
}

