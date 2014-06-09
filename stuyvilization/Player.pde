public class Player {

  int gold;
  boolean enemy;

  public Player(boolean enemy) {
    gold = 100;
    this.enemy = enemy;
  }

  int getGold() {
    return gold;
  }

  void newTurn() {
    for (int y=0; y<game.getHeight (); y++) {
      for (int x=0; x<game.getWidth (); x++) {
        if (!enemy) {
          if (hex(game.getMap()[x][y].getColor()).equals(hex(MYTILE_COLOR))) {
            gold += game.getMap()[x][y].getValue();
          } else if (hex(game.getMap()[x][y].getColor()).equals(hex(MYHOME_COLOR))) {
            gold += game.getMap()[x][y].getValue() * 3;
          }
        } else {
          if (hex(game.getMap()[x][y].getColor()).equals(hex(ENEMYTILE_COLOR))) {
            gold += game.getMap()[x][y].getValue();
          } else if (hex(game.getMap()[x][y].getColor()).equals(hex(ENEMYHOME_COLOR))) {
            gold += game.getMap()[x][y].getValue() * 3;
          }
        }
      }
    }
  }
}
