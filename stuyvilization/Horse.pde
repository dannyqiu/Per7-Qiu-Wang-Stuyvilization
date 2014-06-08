class Horse extends Unit {
  public Horse(int xpos,int ypos) {
    _health = 25;
    _strength = 8;
    _movement = 2;
    _range = 2;
    _cost = 200;
    _name = "Horseman";
    x = xpos;
    y = ypos;
  }
}
