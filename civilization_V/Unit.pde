abstract class Unit {

//Stats
protected int _health = 20;
protected String _status = "Moved"; // (CanMove,Moved,Dead,Defending,Capturing)
protected int _strength, _movement, _range, _cost; 
protected String _name;

//Accessors
int getHealth() {
  return _health;
    }
  
int getStrength() {
  return _strength;
    }
  
    
int getMvm() {
  return _movement;
    }
  
int getRange() {
  return _range;
    }
  
int getCost() {
  return _cost;
    }  
    
String getName(){
  return _name;
}

String getStatus(){
  return _status;
}

  
//Methods
void move(){}
void attack(Unit target) {}
void garrison(){}
void capture(){}
void die(){}
}

