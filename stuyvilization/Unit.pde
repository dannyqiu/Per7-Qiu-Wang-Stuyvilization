abstract class Unit {

  //Stats
  int _health, _strength, _range, _cost, _movement, x, y;
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

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }

  void setX(int xpos) {
    x = xpos;
  }  
  void setY(int ypos) {
    y = ypos;
  }

  //Methods
  void move(int x, int y) {
    this.x = x;
    this.y = y;
    attack();
    capture();
    _movement--;
  }

  void attack() {
    for (int i=0; i<Units.size (); i++) {
      Unit u = Units.get(i);
      if (u != null && u.enemy != this.enemy) {
        while (game.getNearestTile (u.getX (), u.getY()) == game.getNearestTile(this.getX(), this.getY())) {
          attack(u);
          u.attack(this);
          if (u.getHealth() <= 0) {
            unitsSprites.get(i).setDead(true);
            Units.set(i, null);
            break;
          }
          if (this.getHealth() <= 0) {
            unitsSprites.get(Units.indexOf(this)).setDead(true);
            Units.set(Units.indexOf(this), null);
            break;
          }
        }
      }
    }
  }

  void attack(Unit target) {
    target._health -= this.getStrength();
  }

  void capture() {
    Tile current = game.getNearestTile(x, y);
    if (!enemy) {
      if (!hex(current.getColor()).equals(hex(MYHOME_COLOR)) && !hex(current.getColor()).equals(hex(PATH_COLOR)) && !hex(current.getColor()).equals(hex(WATER_COLOR)) && !hex(current.getColor()).equals(hex(MOUNTAIN_COLOR))) {
        if (hex(current.getColor()).equals(hex(ENEMYHOME_COLOR)))
          {Player1 = true;}           
        current.setColor(MYTILE_COLOR);
      }
    } 
    else {
      if (!hex(current.getColor()).equals(hex(ENEMYHOME_COLOR)) && !hex(current.getColor()).equals(hex(PATH_COLOR)) && !hex(current.getColor()).equals(hex(WATER_COLOR)) && !hex(current.getColor()).equals(hex(MOUNTAIN_COLOR))) {
      if (hex(current.getColor()).equals(hex(MYHOME_COLOR)))
          {Player2 = true;}    
      current.setColor(ENEMYTILE_COLOR);
    }
  }
  }
}

