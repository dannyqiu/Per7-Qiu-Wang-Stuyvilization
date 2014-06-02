Map game;

public void setup() {
  size(MAP_WIDTH, MAP_HEIGHT);
  game = new Map();
}

public void draw() {
  game.draw();
}

