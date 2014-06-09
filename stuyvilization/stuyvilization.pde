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
  "Stuyvilization Press Spacebar To Start"
};

PFont f; 
float x; 
int index = 0;
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
  f = createFont("Arial", 20, true);  
  x = width; 
  start = loadImage("Images/2048.jpg");
}

public void draw() {
  if (menu == true) {
    image(start, 0, 0, 1280, 720);
    fill(0);
    textFont(f, 40);        
    textAlign(LEFT);
    text(headlines[index], x, 180); 
    x = x - 3;
    float w = textWidth(headlines[index]);
    if (x < -w) {
      x = width; 
      index = (index + 1) % headlines.length;
    }
    if (keyPressed) {
      if (key == ' ') {
        menu = false;
      }
    }
  }
  if (menu == false) { 
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
      image(win, 500, 360);
    } else if (Player2 == true) {
      PImage win = loadImage("Images/p2.jpg");
      image(win, 500, 360);
    }
  }
}

