class Warrior extends Unit {
  public Warrior(int xpos,int ypos) {
    _health = 20;
    _strength = 6;
    _movement = 2;
    _range = 1;
    _cost = 40;
    _name = "Warrior";
    x = xpos;
    y = ypos;
  }
}
