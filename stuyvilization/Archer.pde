class Archer extends Unit {
  public Archer(int xpos,int ypos) {
    _health = 20;
    _strength = 3;
    _movement = 2;
    _range = 2;
    _cost = 40;
    _name = "Archer";
    x = xpos;
    y = ypos;
  }
}
