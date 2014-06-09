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
  
  public void CreateCapital(){
  Tile Current = game.getNearestTile(x,y);
  ArrayList<Tile> N = Current.getNeighbors();
  for (Tile x: N){
    if (hex(x.getColor()).equals(hex(LAND_COLOR)) || hex(x.getColor()).equals(hex(MYTILE_COLOR)))
    x.setColor(MYTILE_COLOR);
  }
  Current.setColor(#7FFF00);
  CapitalX = x;
  CapitalY = y;
  }
}
