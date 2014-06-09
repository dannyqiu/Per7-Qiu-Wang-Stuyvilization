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
int enemyUnitNumber = 0;
int Turn = 1;
synchronized public void draw (GWinApplet appc, GWinData data) {
} 

Tile gPlayerStartUnit(Map map) {
  int mapX = (int) random(MAP_WIDTH / (TILE_SIZE * 4));
  int mapY = (int) random(MAP_HEIGHT / (TILE_SIZE * 2));
  Tile start = map.getMap()[mapX][mapY];
  while (hex (start.getColor ()).equals(hex(WATER_COLOR))) {
    mapX = (int) random(MAP_WIDTH / (TILE_SIZE * 4));
    mapY = (int) random(MAP_HEIGHT / (TILE_SIZE * 2));
    start = map.getMap()[mapX][mapY];
  }
  start.setColor(MYTILE_COLOR);
  Unit Settler = new Settler(start.getCenterX(), start.getCenterY());
  Units.add(Settler);
  Sprite X = new Sprite(this, "Images/settler.png", UnitNumber);
  UnitNumber ++;
  X.setXY(start.getCenterX(), start.getCenterY());
  X.respondToMouse(true);
  X.addEventHandler(this, "movement");
  return start;
}

Tile gEnemyStartUnit(Map map) {
  int startX = (int) (random(MAP_WIDTH / (TILE_SIZE * 4)) + MAP_WIDTH / (TILE_SIZE * 4));
  int startY = (int) random(MAP_HEIGHT / (TILE_SIZE * 2));
  Tile start = map.getMap()[startX][startY];
  while (hex (start.getColor ()).equals(hex(WATER_COLOR))) {
    startX = (int) (random(MAP_WIDTH / (TILE_SIZE * 4)) + MAP_WIDTH / (TILE_SIZE * 4));
    startY = (int) random(MAP_HEIGHT / (TILE_SIZE * 2));
    start = map.getMap()[startX][startY];
  }
  start.setColor(MYTILE_COLOR);
  Unit Settler = new Settler(start.getCenterX(), start.getCenterY());
  Units.add(Settler);
  Sprite X = new Sprite(this, "Images/settler.png", UnitNumber);
  enemyUnitNumber++;
  X.setXY(start.getCenterX(), start.getCenterY());
  X.respondToMouse(true);
  X.addEventHandler(this, "movement");
  return start;
}

void movement(Sprite sprite) {
  Unit Selected = Units.get(sprite.getZorder());
  Tile Current = game.getNearestTile(Selected.y, Selected.y);
  ArrayList<Tile> N = Current.getNeighbors();
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
          (hex(start.getColor()).equals(hex(LAND_COLOR)) || hex(start.getColor()).equals(hex(MYTILE_COLOR)) || hex(start.getColor()).equals(hex(MYHOME_COLOR)))) {
          sprite.setXY(start.getCenterX(), start.getCenterY());
          if ( hex(start.getColor()).equals(hex(MYHOME_COLOR))) {
          } else {
            start.setColor(MYTILE_COLOR);
          }
          Selected.x = start.getCenterX();
          Selected.y = start.getCenterY();
          Selected._movement --;
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
  Turn += 1;
  History.setText("Turn " + Turn);
} 

public void Unit1Click(GImageButton source, GEvent event) {
  if (CapitalX == 0 && CapitalY == 0) {
    History.appendText("No Capital");
  } else { 
    Sprite X = new Sprite(this, "Images/thief.png", UnitNumber); 
    UnitNumber ++;
    Tile start = game.getNearestTile(CapitalX, CapitalY);
    X.setXY(start.getCenterX(), start.getCenterY());
    Unit Thief = new Thief(40, 50);
    Units.add (Thief);
    X.respondToMouse(true);
    X.addEventHandler(this, "movement");
    Me.gold -= Thief._cost;
  }
}

public void UnitClick2(GImageButton source, GEvent event) {
  if (CapitalX == 0 && CapitalY == 0) {
    History.appendText("No Capital");
  } else { 
    Sprite X = new Sprite(this, "Images/warrior.png", UnitNumber); 
    UnitNumber ++;
    Tile start = game.getNearestTile(CapitalX, CapitalY);
    X.setXY(start.getCenterX(), start.getCenterY());
    Unit Warrior = new Warrior(40, 50);
    Units.add (Warrior);
    X.respondToMouse(true);
    X.addEventHandler(this, "movement");
    Me.gold -= Warrior._cost;
  }
} 

public void UnitClick3(GImageButton source, GEvent event) { 
  if (CapitalX == 0 && CapitalY == 0) {
    History.appendText("No Capital");
  } else { 
    Sprite X = new Sprite(this, "Images/archer.png", UnitNumber); 
    UnitNumber ++;
    Tile start = game.getNearestTile(CapitalX, CapitalY);
    X.setXY(start.getCenterX(), start.getCenterY());
    Unit Archer = new Archer(40, 50);
    Units.add (Archer);
    X.respondToMouse(true);
    X.addEventHandler(this, "movement");
    Me.gold -= Archer._cost;
  }
}

public void UnitClick4(GImageButton source, GEvent event) { 
  if (CapitalX == 0 && CapitalY == 0) {
    History.appendText("No Capital");
  } else { 
    Sprite X = new Sprite(this, "Images/settler.png", UnitNumber); 
    UnitNumber ++;
    Tile start = game.getNearestTile(CapitalX, CapitalY);
    X.setXY(start.getCenterX(), start.getCenterY());
    Unit Settler = new Settler(40, 50);
    Units.add (Settler);
    X.respondToMouse(true);
    X.addEventHandler(this, "movement");
    Me.gold -= Settler._cost;
  }
} 

public void Unit5Click(GImageButton source, GEvent event) {
  if (CapitalX == 0 && CapitalY == 0) {
    History.appendText("No Capital");
  } else { 
    Sprite X = new Sprite(this, "Images/mage.png", UnitNumber); 
    UnitNumber ++;
    Tile start = game.getNearestTile(CapitalX, CapitalY);
    X.setXY(start.getCenterX(), start.getCenterY());
    Unit Mage = new Mage(40, 50);
    Units.add (Mage);
    X.respondToMouse(true);
    X.addEventHandler(this, "movement");
    Me.gold -= Mage._cost;
  }
} 

public void Unit6Click(GImageButton source, GEvent event) {
  if (CapitalX == 0 && CapitalY == 0) {
    History.appendText("No Capital");
  } else { 
    Sprite X = new Sprite(this, "Images/knight.png", UnitNumber); 
    UnitNumber ++;
    Tile start = game.getNearestTile(CapitalX, CapitalY);
    X.setXY(start.getCenterX(), start.getCenterY());
    Unit Knight = new Knight(40, 50);
    Units.add (Knight);
    X.respondToMouse(true);
    X.addEventHandler(this, "movement");
    Me.gold -= Knight._cost;
  }
} 

public void Unit7Click(GImageButton source, GEvent event) { 
  if (CapitalX == 0 && CapitalY == 0) {
    History.appendText("No Capital");
  } else { 
    Sprite X = new Sprite(this, "Images/horse.png", UnitNumber); 
    UnitNumber ++;
    Tile start = game.getNearestTile(CapitalX, CapitalY);
    X.setXY(start.getCenterX(), start.getCenterY());
    Unit Horse = new Horse(40, 50);
    Units.add (Horse);
    X.respondToMouse(true);
    X.addEventHandler(this, "movement");
    Me.gold -= Horse._cost;
  }
} 

public void Unit8Click(GImageButton source, GEvent event) { 
  if (CapitalX == 0 && CapitalY == 0) {
    History.appendText("No Capital");
  } else { 
    Sprite X = new Sprite(this, "Images/berserker.png", UnitNumber); 
    UnitNumber ++;
    Tile start = game.getNearestTile(CapitalX, CapitalY);
    X.setXY(start.getCenterX(), start.getCenterY());
    Unit Berserker = new Berserker(40, 50);
    Units.add (Berserker);
    X.respondToMouse(true);
    X.addEventHandler(this, "movement");
    Me.gold -= Berserker._cost;
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

