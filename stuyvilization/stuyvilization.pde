import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

import g4p_controls.*;
Map game;
Generator generator;
Player Me;
Player Enemy;

PImage start;
String[] headlines = {
  "Stuyvilization", "Press Spacebar To Start"
};

PFont header, sub; 
float x, w;
boolean menu;

public void setup() {
  setLocation(0, 0);
  size(MAP_WIDTH, MAP_HEIGHT);
  game = new Map();
  generator = new Generator();
  generator.generateMap(game);
  createGUI();
  Me = new Player(false);
  Enemy = new Player(true);

  menu = true;
  header = createFont("Arial", MAP_HEIGHT / 8.5, true);  
  sub = createFont("Arial", MAP_HEIGHT / 15, true);  
  start = loadImage("Images/2048.jpg");
  x = MAP_WIDTH;
  w = textWidth(headlines[1]);
}

public void draw() {
  if (menu) {
    image(start, 0, 0, MAP_WIDTH, MAP_HEIGHT);
    fill(0);
    textFont(header);
    textAlign(CENTER);
    text(headlines[0], x, MAP_HEIGHT / 2.5);
    textFont(sub);
    text(headlines[1], x, MAP_HEIGHT / 2);
    x = x - 5;
    if (x < -w) {
      x = MAP_WIDTH;
    }
    if (keyPressed) {
      if (key == ' ') {
        menu = false;
      }
    }
  } else {
    if (Player1 != true && Player2!= true) {
      if (Turn % 2 == 1) {
        Stats.setDefaultText ("Gold : " + Me.getGold());
      } else {
        Stats.setDefaultText ("Gold : " + Enemy.getGold());
      }
      background(255);
      game.draw();
      S4P.updateSprites(1);
      S4P.drawSprites();
    } else if (Player1 == true) {
      PImage win = loadImage("Images/p1.jpg");
      image(win, MAP_WIDTH / 2, MAP_HEIGHT / 2);
    } else if (Player2 == true) {
      PImage win = loadImage("Images/p2.jpg");
      image(win, MAP_WIDTH / 2, MAP_HEIGHT / 2);
    }
  }
}

