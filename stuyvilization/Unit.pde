abstract class Unit {

  //Stats
  protected int _health, _strength, _defense, _speed, _range, _cost; 
  protected String _name, _status; // (CanMove,Moved,Dead,Defending,Capturing)

  //Accessors
  int getHealth() {
    return _health;
  }

  int getStrength() {
    return _strength;
  }

  int getDefense() {
    return _defense;
  }

  int getSpeed() {
    return _speed;
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

  //Methods
  void move() {
  }
  void attack(Unit target) {
  }
  void garrison() {
  }
  void capture() {
  }
  void die() {
  }
}
