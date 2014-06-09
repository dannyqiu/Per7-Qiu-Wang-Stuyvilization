import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

import g4p_controls.*;
Map game;
Generator generator;
Player Me;
Player Enemy;

public void setup() {
  setLocation(0, 0);
  size(MAP_WIDTH, MAP_HEIGHT);
  game = new Map();
  generator = new Generator();
  generator.generateMap(game);
  createGUI();
  Me = new Player();
  Enemy = new Player();
}

public void draw() {
  if (Turn % 2 == 1) {
    Stats.setDefaultText ("Gold : " + Me.getGold());
  } else {
    Stats.setDefaultText ("Gold : " + Enemy.getGold());
  }
  background(255);
  game.draw();
  S4P.updateSprites(1);
  S4P.drawSprites();
}

