Map game;


public void setup() {
  size(MAP_WIDTH, MAP_HEIGHT);
  game = new Map();
}

public void draw() {
  game.draw();
}

void mouseClicked() {
  Tile tmp = game.getNearestTile(mouseX, mouseY);
  tmp.tileColor = #0074D9;
  println(mouseX);
  println(mouseY);
}

