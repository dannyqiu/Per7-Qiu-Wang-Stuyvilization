class Knight extends Unit {
  public Knight(int xpos,int ypos) {
    _health = 35;
    _strength = 10;
    _movement = 2;
    _range = 1;
    _cost = 300;
    _name = "Knight";
    x = xpos;
    y = ypos;
  }
}
