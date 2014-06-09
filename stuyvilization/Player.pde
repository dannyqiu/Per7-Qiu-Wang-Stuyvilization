public class Player {

  int gold;

  public Player() {
    gold = 100;
  }

  int getGold() {
    return gold;
  }

  void newTurn() {
    for (int y=0; y<game.getHeight (); y++) {
      for (int x=0; x<game.getWidth (); x++) {
        if (hex(game.getMap()[x][y].getColor()).equals(hex(MYTILE_COLOR))) {
          gold += game.getMap()[x][y].getValue();
        } else if (hex(game.getMap()[x][y].getColor()).equals(hex(MYHOME_COLOR))) {
          gold += game.getMap()[x][y].getValue() * 3;
        }
      }
    }
  }
}

