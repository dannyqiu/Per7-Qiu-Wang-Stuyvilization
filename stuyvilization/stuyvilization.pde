import sprites.utils.*;
import sprites.maths.*;
import sprites.*;


import g4p_controls.*;
Map game;
Generator generator;

public void setup() {
  setLocation(0,0);
  size(MAP_WIDTH, MAP_HEIGHT);
  game = new Map();
  generator = new Generator();
  generator.generateMap(game);
  createGUI();
  Me = new Player();
}


    
public void draw() {  
  Stats.setDefaultText ("Gold : " + Me.getGold());  
  background(255);
  game.draw();
  S4P.updateSprites(1);
  S4P.drawSprites();
}
