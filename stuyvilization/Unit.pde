abstract class Unit {

  //Stats
  int _health, _strength, _range, _cost, _movement,x,y;
  String _name, _status; // (CanMove,Moved,Dead,Defending,Capturing)

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
     capture(map);
   }  
  void attack(Unit target) {
    target._health -= this.getStrength();
  }
  void capture(Map map) {
    Tile current = map.getMap()[x][y];
    current.setColor(MYTILE_COLOR);
  }
}
