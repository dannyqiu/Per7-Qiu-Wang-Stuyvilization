class Mage extends Unit {
  public Mage(int xpos,int ypos) {
    _health = 15;
    _strength = 5;
    _movement = 2;
    _range = 2;
    _cost = 100;
    _name = "Mage";
    x = xpos;
    y = ypos;
  }
}
