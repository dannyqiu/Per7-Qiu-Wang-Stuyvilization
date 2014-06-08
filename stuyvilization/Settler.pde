class Settler extends Unit {
  public Settler(int xpos,int ypos) {
    _health = 10;
    _strength = 0;
    _movement = 2;
    _range = 0;
    _cost = 200;
    _name = "Settler";
    x = xpos;
    y = ypos;
  }
}
