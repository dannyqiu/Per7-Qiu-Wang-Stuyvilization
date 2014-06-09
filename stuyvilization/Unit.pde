abstract class Unit {

  //Stats
  int _health, _strength, _range, _cost, _movement,x,y;
  String _name, _status; // (CanMove,Moved,Dead,Defending,Capturing)
  boolean enemy = false;

  //Accessors
  int getHealth() {
    return _health;
  }

  int getStrength() {
    return _strength;
  }

  int getRange() {
    return _range;
  }

  int getCost() {
    return _cost;
  }  

  String getName() {
    return _name;
  }

  String getStatus() {
    return _status;
  }

  void setX(int xpos) {
    x = xpos;
  }  
  void setY(int ypos) {
    y = ypos;
  }  
  //Methods
  void move(Map map) {
     x = mouseX;
     y = mouseY;
     capture();
   }  
  void attack(Unit target) {
    target._health -= this.getStrength();
  }
  void capture() {
    Tile current = game.getMap()[x][y];
    if (!enemy) {
      current.setColor(MYTILE_COLOR);
    }
    else {
      current.setColor(ENEMYTILE_COLOR);
    }
  }

}
