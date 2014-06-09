GWindow window1;
GButton EndTurnButton; 
GImageButton Unit1; 
GImageButton Unit2;
GImageButton Unit3; 
GImageButton Unit4; 
GImageButton Unit5; 
GImageButton Unit6; 
GImageButton Unit7; 
GImageButton Unit8; 
GTextArea History; 
GTextArea Stats;

GImageButton Start; 
int UnitNumber = 0;

synchronized public void draw (GWinApplet appc, GWinData data) {
} 

Tile gPlayerStartUnit(Map map) {
  int startX = (int) random(map.getWidth() / 2);
  int startY = (int) random(map.getHeight() / 2);
  Tile start = map.getMap()[startX][startY];
  while (hex (start.getColor ()).equals(hex(WATER_COLOR))) {
    startX = (int) random(map.getWidth() / 2);
    startY = (int) random(map.getHeight() / 2);
    start = map.getMap()[startX][startY];
  }
  start.setColor(MYTILE_COLOR);
  Unit Settler = new Settler(start.getCenterX(), start.getCenterY());
  Units.add(Settler);
  PLAYER_SETTLER = new Sprite(this, "Images/settler.png", UnitNumber);
  UnitNumber ++;
  PLAYER_SETTLER.setXY(start.getCenterX(), start.getCenterY());
  PLAYER_SETTLER.respondToMouse(true);
  PLAYER_SETTLER.addEventHandler(this, "movement");
  return start;
}

Tile gEnemyStartUnit(Map map) {
  int startX = (int) (random(map.getWidth() / 2) + map.getWidth() / 2);
  int startY = (int) random(map.getHeight() / 2);
  Tile start = map.getMap()[startX][startY];
  while (hex (start.getColor ()).equals(hex(WATER_COLOR))) {
    startX = (int) (random(map.getWidth() / 2) + map.getWidth() / 2);
    startY = (int) random(map.getHeight() / 2);
    start = map.getMap()[startX][startY];
  }
  start.setColor(ENEMYTILE_COLOR);
  Unit Settler = new Settler(start.getCenterX(), start.getCenterY());
  Units.add(Settler);
  Settler.enemy = true;
  ENEMY_SETTLER = new Sprite(this, "Images/settler.png", UnitNumber);
  UnitNumber++;
  ENEMY_SETTLER.setXY(start.getCenterX(), start.getCenterY());
  ENEMY_SETTLER.respondToMouse(true);
  ENEMY_SETTLER.addEventHandler(this, "movement");
  return start;
}

void movement(Sprite sprite) {
  Unit Selected = Units.get(sprite.getZorder());
  if ((!Selected.enemy && Turn % 2 == 1) || (Selected.enemy && Turn % 2 == 0)) {
    Tile Current = game.getNearestTile(Selected.x, Selected.y);
    //ArrayList<Tile> N = Current.getNeighbors();
    if (sprite.eventType == Sprite.CLICK && Selected instanceof Settler) {
      ((Settler) Selected).CreateCapital();
      sprite.setDead(true);
    }
    if (sprite.eventType == Sprite.PRESS) {
    } else if (sprite.eventType == Sprite.RELEASE) {
      if (Selected._movement > 0) {
        Tile start = game.getNearestTile(mouseX, mouseY);
        ArrayList<Tile> Test = start.getNeighbors();
        for (Tile x : Test) {
          if ((x.getCenterX() == (int) sprite.getX() && x.getCenterY() == (int) sprite.getY()) && 
            (!hex(start.getColor()).equals(hex(WATER_COLOR)) && !hex(start.getColor()).equals(hex(MOUNTAIN_COLOR)))) {
            sprite.setXY(start.getCenterX(), start.getCenterY());
            Selected.move(start.getCenterX(), start.getCenterY());
          }
        }
      }
    }
  }
}

public void StartClick(GImageButton source, GEvent event) {
}

public void EndTurnClick(GButton source, GEvent event) { 
  for (Unit x : Units) {
    x._movement = 2;
  }
  Turn ++;
  if (Turn % 2 == 1) {
    Me.newTurn();
    History.setText("Turn " + Turn + ": Player 1");
  } else {
    Enemy.newTurn();
    History.setText("Turn " + Turn + ": Player 2");
  }
} 

public void Unit1Click(GImageButton source, GEvent event) {
  if (Turn % 2 == 1) {
    if (CapitalX == -1 && CapitalY == -1) {
      History.appendText("No Capital");
    } else { 
      Unit Thief = new Thief(40, 50);
      if (Me.gold > Thief._cost) {
        Sprite X = new Sprite(this, "Images/thief.png", UnitNumber);
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(CapitalX, CapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Units.add (Thief);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Me.gold -= Thief._cost;
      } else {
        History.appendText("Not enough gold to buy a Thief!");
      }
    }
  } else {
    if (enemyCapitalX == -1 && enemyCapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Thief = new Thief(40, 50);
      if (Enemy.gold > Thief._cost) {
        Sprite X = new Sprite(this, "Images/thief.png", UnitNumber);
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(enemyCapitalX, enemyCapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Thief.enemy = true;
        Units.add (Thief);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Enemy.gold -= Thief._cost;
      } else {
        History.appendText("Not enough gold to buy a Thief!");
      }
    }
  }
}

public void UnitClick2(GImageButton source, GEvent event) {
  if (Turn % 2 == 1) {
    if (CapitalX == -1 && CapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Warrior = new Warrior(40, 50);
      if (Me.gold > Warrior._cost) {
        Sprite X = new Sprite(this, "Images/warrior.png", UnitNumber); 
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(CapitalX, CapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Units.add (Warrior);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Me.gold -= Warrior._cost;
      } else {
        History.appendText("Not enough gold to buy a Warrior!");
      }
    }
  } else {
    if (enemyCapitalX == -1 && enemyCapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Warrior = new Warrior(40, 50);
      if (Enemy.gold > Warrior._cost) {
        Sprite X = new Sprite(this, "Images/warrior.png", UnitNumber);
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(enemyCapitalX, enemyCapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Warrior.enemy = true;
        Units.add (Warrior);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Enemy.gold -= Warrior._cost;
      } else {
        History.appendText("Not enough gold to buy a Warrior!");
      }
    }
  }
} 

public void UnitClick3(GImageButton source, GEvent event) {
  if (Turn % 2 == 1) {
    if (CapitalX == -1 && CapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Archer = new Archer(40, 50);
      if (Me.gold > Archer._cost) {
        Sprite X = new Sprite(this, "Images/archer.png", UnitNumber); 
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(CapitalX, CapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Units.add (Archer);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Me.gold -= Archer._cost;
      } else {
        History.appendText("Not enough gold to buy a Archer!");
      }
    }
  } else {
    if (enemyCapitalX == -1 && enemyCapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Archer = new Archer(40, 50);
      if (Enemy.gold > Archer._cost) {
        Sprite X = new Sprite(this, "Images/archer.png", UnitNumber);
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(enemyCapitalX, enemyCapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Archer.enemy = true;
        Units.add (Archer);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Enemy.gold -= Archer._cost;
      } else {
        History.appendText("Not enough gold to buy a Archer!");
      }
    }
  }
}

public void UnitClick4(GImageButton source, GEvent event) { 
  if (Turn % 2 == 1) {
    if (CapitalX == -1 && CapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Monk = new Monk(40, 50);
      if (Me.gold > Monk._cost) {
        Sprite X = new Sprite(this, "Images/monk.png", UnitNumber); 
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(CapitalX, CapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Units.add (Monk);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Me.gold -= Monk._cost;
      } else {
        History.appendText("Not enough gold to buy a Monk!");
      }
    }
  } else {
    if (enemyCapitalX == -1 && enemyCapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Monk = new Monk(40, 50);
      if (Enemy.gold > Monk._cost) {
        Sprite X = new Sprite(this, "Images/monk.png", UnitNumber);
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(enemyCapitalX, enemyCapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Monk.enemy = true;
        Units.add (Monk);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Enemy.gold -= Monk._cost;
      } else {
        History.appendText("Not enough gold to buy a Settler!");
      }
    }
  }
} 

public void Unit5Click(GImageButton source, GEvent event) {
  if (Turn % 2 == 1) {
    if (CapitalX == -1 && CapitalY == -1) {
      History.appendText("No Capital");
    } else { 
      Unit Mage = new Mage(40, 50);
      if (Me.gold > Mage._cost) {
        Sprite X = new Sprite(this, "Images/mage.png", UnitNumber); 
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(CapitalX, CapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Units.add (Mage);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Me.gold -= Mage._cost;
      } else {
        History.appendText("Not enough gold to buy a Mage!");
      }
    }
  } else {
    if (enemyCapitalX == -1 && enemyCapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Mage = new Mage(40, 50);
      if (Enemy.gold > Mage._cost) {
        Sprite X = new Sprite(this, "Images/mage.png", UnitNumber);
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(enemyCapitalX, enemyCapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Mage.enemy = true;
        Units.add (Mage);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Enemy.gold -= Mage._cost;
      } else {
        History.appendText("Not enough gold to buy a Mage!");
      }
    }
  }
} 

public void Unit6Click(GImageButton source, GEvent event) {
  if (Turn % 2 == 1) {
    if (CapitalX == -1 && CapitalY == -1) {
      History.appendText("No Capital");
    } else { 
      Unit Knight = new Knight(40, 50);
      if (Me.gold > Knight._cost) {
        Sprite X = new Sprite(this, "Images/knight.png", UnitNumber); 
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(CapitalX, CapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Units.add (Knight);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Me.gold -= Knight._cost;
      } else {
        History.appendText("Not enough gold to buy a Knight!");
      }
    }
  } else {
    if (enemyCapitalX == -1 && enemyCapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Knight = new Knight(40, 50);
      if (Enemy.gold > Knight._cost) {
        Sprite X = new Sprite(this, "Images/knight.png", UnitNumber);
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(enemyCapitalX, enemyCapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Knight.enemy = true;
        Units.add (Knight);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Enemy.gold -= Knight._cost;
      } else {
        History.appendText("Not enough gold to buy a Knight!");
      }
    }
  }
} 

public void Unit7Click(GImageButton source, GEvent event) { 
  if (Turn % 2 == 1) {
    if (CapitalX == -1 && CapitalY == -1) {
      History.appendText("No Capital");
    } else { 
      Unit Horse = new Horse(40, 50);
      if (Me.gold > Horse._cost) {
        Sprite X = new Sprite(this, "Images/horse.png", UnitNumber); 
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(CapitalX, CapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Units.add (Horse);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Me.gold -= Horse._cost;
      } else {
        History.appendText("Not enough gold to buy a Horseman!");
      }
    }
  } else {
    if (enemyCapitalX == -1 && enemyCapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Horse = new Horse(40, 50);
      if (Enemy.gold > Horse._cost) {
        Sprite X = new Sprite(this, "Images/horse.png", UnitNumber);
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(enemyCapitalX, enemyCapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Horse.enemy = true;
        Units.add (Horse);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Enemy.gold -= Horse._cost;
      } else {
        History.appendText("Not enough gold to buy a Horseman!");
      }
    }
  }
} 

public void Unit8Click(GImageButton source, GEvent event) { 
  if (Turn % 2 == 1) {
    if (CapitalX == -1 && CapitalY == -1) {
      History.appendText("No Capital");
    } else { 
      Unit Berserker = new Berserker(40, 50);
      if (Me.gold > Berserker._cost) {
        Sprite X = new Sprite(this, "Images/berserker.png", UnitNumber); 
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(CapitalX, CapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Units.add (Berserker);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Me.gold -= Berserker._cost;
      } else {
        History.appendText("Not enough gold to buy a Berserker!");
      }
    }
  } else {
    if (enemyCapitalX == -1 && enemyCapitalY == -1) {
      History.appendText("No Capital");
    } else {
      Unit Berserker = new Berserker(40, 50);
      if (Enemy.gold > Berserker._cost) {
        Sprite X = new Sprite(this, "Images/berserker.png", UnitNumber);
        unitsSprites.add(X);
        UnitNumber ++;
        Tile start = game.getNearestTile(enemyCapitalX, enemyCapitalY);
        X.setXY(start.getCenterX(), start.getCenterY());
        Berserker.enemy = true;
        Units.add (Berserker);
        X.respondToMouse(true);
        X.addEventHandler(this, "movement");
        Enemy.gold -= Berserker._cost;
      } else {
        History.appendText("Not enough gold to buy a Berserker!");
      }
    }
  }
} 

public void Record(GTextArea source, GEvent event) {
} 

public void createGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if (frame != null)
    frame.setTitle("Sketch Window");
  window1 = new GWindow(this, "Window title", 0, 0, 280, 720, false, JAVA2D);
  window1.addDrawHandler(this, "draw");
  window1.setOnTop(true);
  window1.setLocation (1000, 0);
  EndTurnButton = new GButton(window1.papplet, 0, 0, 80, 160);
  EndTurnButton.setText("End Turn");
  EndTurnButton.addEventHandler(this, "EndTurnClick");
  Unit1 = new GImageButton(window1.papplet, 0, 160, 140, 140, new String[] { 
    "Images/Scout_(Civ5).png", "Images/Scout_(Civ5).png", "Images/Scout_(Civ5).png"
  } 
  );
  Unit1.addEventHandler(this, "Unit1Click");
  Unit2 = new GImageButton(window1.papplet, 140, 160, 140, 140, new String[] { 
    "Images/Warrior_(Civ5).png", "Images/Warrior_(Civ5).png", "Images/Warrior_(Civ5).png"
  } 
  );
  Unit2.addEventHandler(this, "UnitClick2");
  Unit3 = new GImageButton(window1.papplet, 0, 300, 140, 140, new String[] { 
    "Images/Archer_(Civ5).png", "Images/Archer_(Civ5).png", "Images/Archer_(Civ5).png"
  } 
  );
  Unit3.addEventHandler(this, "UnitClick3");
  Unit4 = new GImageButton(window1.papplet, 140, 300, 140, 140, new String[] { 
    "Images/monk_.png", "Images/monk_.png", "Images/monk_.png"
  } 
  );
  Unit4.addEventHandler(this, "UnitClick4");
  Unit5 = new GImageButton(window1.papplet, 0, 440, 140, 140, new String[] { 
    "Images/Prophet_(Civ5).png", "Images/Prophet_(Civ5).png", "Images/Prophet_(Civ5).png"
  } 
  );
  Unit5.addEventHandler(this, "Unit5Click");
  Unit6 = new GImageButton(window1.papplet, 140, 440, 140, 140, new String[] { 
    "Images/Longswordsman_(Civ5).png", "Images/Longswordsman_(Civ5).png", "Images/Longswordsman_(Civ5).png"
  } 
  );
  Unit6.addEventHandler(this, "Unit6Click");
  Unit7 = new GImageButton(window1.papplet, 0, 580, 140, 140, new String[] { 
    "Images/Knight_(Civ5).png", "Images/Knight_(Civ5).png", "Images/Knight_(Civ5).png"
  } 
  );
  Unit7.addEventHandler(this, "Unit7Click");
  Unit8 = new GImageButton(window1.papplet, 140, 580, 140, 140, new String[] { 
    "Images/Berserker_(Civ5).png", "Images/Berserker_(Civ5).png", "Images/Berserker_(Civ5).png"
  } 
  );
  Unit8.addEventHandler(this, "Unit8Click");
  Stats = new GTextArea (window1.papplet, 80, 0, 200, 25, G4P.SCROLLBARS_NONE);
  Stats.setTextEditEnabled(false);
  History = new GTextArea(window1.papplet, 80, 20, 200, 140, G4P.SCROLLBARS_NONE);
  History.setTextEditEnabled(false);
  History.setText ("Turn 1: \n Click to Settle, Drag to Move");
  History.addEventHandler(this, "Record");
}

