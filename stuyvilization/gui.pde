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
Player Me;
int UnitNumber = 0;
synchronized public void draw (GWinApplet appc, GWinData data) { 
} 

 void gStartUnit(Map map){
    int mapX = (int) random(MAP_WIDTH / (TILE_SIZE * 2));
    int mapY = (int) random(MAP_HEIGHT / (TILE_SIZE * 2));
    Tile start = map.getMap()[mapX][mapY];
    while (hex (start.getColor ()).equals(hex(WATER_COLOR))){
    mapX = (int) random(MAP_WIDTH / (TILE_SIZE * 2));
    mapY = (int) random(MAP_HEIGHT / (TILE_SIZE * 2));
    start = map.getMap()[mapX][mapY];}
    Unit Settler = new Settler(mapX,mapY);
    Units.add(Settler);
    Sprite X = new Sprite(this,"Images/settler.png",UnitNumber);
    UnitNumber ++;
    X.setXY(start.getCenterX(),start.getCenterY());
    X.respondToMouse(true);
    X.addEventHandler(this,"movement");
  }
  
  
void movement(Sprite sprite) {
  Unit Selected = Units.get(sprite.getZorder());
  if(sprite.eventType == Sprite.PRESS){
    Selected.capture(game);
}
  else if(sprite.eventType == Sprite.RELEASE){
    if (Selected._movement > 0){
    sprite.setXY(mouseX,mouseY);
    Selected._movement --;}
    }
   }

  
public void StartClick(GImageButton source, GEvent event) { 
}

public void EndTurnClick(GButton source, GEvent event) { 
  for (Unit x: Units){
    x._movement = 2;}
} 

public void Unit1Click(GImageButton source, GEvent event) { 
 Sprite X = new Sprite(this,"Images/scout.png",UnitNumber); 
 UnitNumber ++;
 X.setXY(35,50);
 Unit Scout = new Scout(40,50);
 Units.add (Scout);
 X.respondToMouse(true);
 X.addEventHandler(this,"movement");
 Me.gold -= Scout._cost;
}

public void UnitClick2(GImageButton source, GEvent event) {
 Sprite X = new Sprite(this,"Images/warrior.png",UnitNumber); 
 UnitNumber ++;
 X.setXY(35,50);
 Unit Warrior = new Warrior(40,50);
 Units.add (Warrior);
 X.respondToMouse(true);
 X.addEventHandler(this,"movement");
 Me.gold -= Warrior._cost;
} 

public void UnitClick3(GImageButton source, GEvent event) { 
 Sprite X = new Sprite(this,"Images/archer.png",UnitNumber); 
 UnitNumber ++;
 X.setXY(35,50);
 Unit Archer = new Archer(40,50);
 Units.add (Archer);
 X.respondToMouse(true);
 X.addEventHandler(this,"movement");
 Me.gold -= Archer._cost;
}

public void UnitClick4(GImageButton source, GEvent event) { 
Sprite X = new Sprite(this,"Images/settler.png",UnitNumber); 
 UnitNumber ++;
 X.setXY(35,50);
 Unit Settler = new Settler(40,50);
 Units.add (Settler);
 X.respondToMouse(true);
 X.addEventHandler(this,"movement");
 Me.gold -= Settler._cost;
} 

public void Unit5Click(GImageButton source, GEvent event) {
} 

public void Unit6Click(GImageButton source, GEvent event) {
} 

public void Unit7Click(GImageButton source, GEvent event) { 
 Sprite X = new Sprite(this,"Images/horse.png",UnitNumber); 
 UnitNumber ++;
 X.setXY(35,50);
 Unit Horse = new Horse(40,50);
 Units.add (Horse);
 X.respondToMouse(true);
 X.addEventHandler(this,"movement");
 Me.gold -= Horse._cost;
} 

public void Unit8Click(GImageButton source, GEvent event) { 
} 

public void Record(GTextArea source, GEvent event) { 
} 



public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  window1 = new GWindow(this, "Window title", 0, 0, 280, 720, false, JAVA2D);
  window1.addDrawHandler(this, "draw");
  window1.setOnTop(true);
  window1.setLocation (1000,0);
  EndTurnButton = new GButton(window1.papplet, 0, 0, 80, 160);
  EndTurnButton.setText("End Turn");
  EndTurnButton.addEventHandler(this, "EndTurnClick");
  Unit1 = new GImageButton(window1.papplet, 0, 160, 140, 140, new String[] { "Images/Scout_(Civ5).png", "Images/Scout_(Civ5).png", "Images/Scout_(Civ5).png" } );
  Unit1.addEventHandler(this, "Unit1Click");
  Unit2 = new GImageButton(window1.papplet, 140, 160, 140, 140, new String[] { "Images/Warrior_(Civ5).png", "Images/Warrior_(Civ5).png", "Images/Warrior_(Civ5).png" } );
  Unit2.addEventHandler(this, "UnitClick2");
  Unit3 = new GImageButton(window1.papplet, 0, 300, 140, 140, new String[] { "Images/Archer_(Civ5).png", "Images/Archer_(Civ5).png", "Images/Archer_(Civ5).png" } );
  Unit3.addEventHandler(this, "UnitClick3");
  Unit4 = new GImageButton(window1.papplet, 140, 300, 140, 140, new String[] { "Images/Settler_(Civ5).png", "Images/Settler_(Civ5).png", "Images/Settler_(Civ5).png" } );
  Unit4.addEventHandler(this, "UnitClick4");
  Unit5 = new GImageButton(window1.papplet, 0, 440, 140, 140, new String[] { "Images/Catapult_(Civ5).png", "Images/Catapult_(Civ5).png", "Images/Catapult_(Civ5).png" } );
  Unit5.addEventHandler(this, "Unit5Click");
  Unit6 = new GImageButton(window1.papplet, 140, 440, 140, 140, new String[] { "Images/Longswordsman_(Civ5).png", "Images/Longswordsman_(Civ5).png", "Images/Longswordsman_(Civ5).png" } );
  Unit6.addEventHandler(this, "Unit6Click");
  Unit7 = new GImageButton(window1.papplet, 0, 580, 140, 140, new String[] { "Images/Knight_(Civ5).png", "Images/Knight_(Civ5).png", "Images/Knight_(Civ5).png" } );
  Unit7.addEventHandler(this, "Unit7Click");
  Unit8 = new GImageButton(window1.papplet, 140, 580, 140, 140, new String[] { "Images/Rifleman_(Civ5).png", "Images/Rifleman_(Civ5).png", "Images/Rifleman_(Civ5).png" } );
  Unit8.addEventHandler(this, "Unit8Click");
  Stats = new GTextArea (window1.papplet, 80, 0, 200, 25, G4P.SCROLLBARS_NONE);
  Stats.setTextEditEnabled(false);
  History = new GTextArea(window1.papplet, 80, 20, 200, 140, G4P.SCROLLBARS_NONE);
  History.setTextEditEnabled(false);
  History.setDefaultText ("Welcome");
  History.addEventHandler(this, "Record");
}


