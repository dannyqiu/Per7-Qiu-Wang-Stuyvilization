GWindow window1;
GButton EndTurnButton; 
GImageButton Unit3; 
GImageButton Unit2; 
GImageButton Unit5; 
GImageButton Unit4; 
GImageButton Unit1; 
GImageButton Unit6; 
GImageButton Unit7; 
GImageButton Unit8; 
GTextArea History; 
GTextArea Stats;

synchronized public void draw (GWinApplet appc, GWinData data) { 
} 

public void EndTurnClick(GButton source, GEvent event) { 
} 

public void Unit1Click(GImageButton source, GEvent event) { 
}

public void UnitClick2(GImageButton source, GEvent event) {
} 

public void Unit3Click(GImageButton source, GEvent event) { 
}

public void UnitCick4(GImageButton source, GEvent event) { 
} 

public void Unit5Click(GImageButton source, GEvent event) {
} 

public void Unit6Click(GImageButton source, GEvent event) {
} 

public void Unit7Click(GImageButton source, GEvent event) { 
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
  Unit3.addEventHandler(this, "Unit3Click");
  Unit4 = new GImageButton(window1.papplet, 140, 300, 140, 140, new String[] { "Images/Settler_(Civ5).png", "Images/Settler_(Civ5).png", "Images/Settler_(Civ5).png" } );
  Unit4.addEventHandler(this, "UnitCick4");
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
  Stats.setDefaultText ("Gold : 0");
  History = new GTextArea(window1.papplet, 80, 20, 200, 140, G4P.SCROLLBARS_NONE);
  History.setTextEditEnabled(false);
  History.setDefaultText ("Welcome");
  History.addEventHandler(this, "Record");
}


