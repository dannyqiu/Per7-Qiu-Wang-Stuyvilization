public void button1_click1(GButton source, GEvent event) { 
} 

public void button2_click1(GButton source, GEvent event) { 
} 

public void button3_click1(GButton source, GEvent event) {
} 

public void button4_click1(GButton source, GEvent event) { 
} 

public void button5_click1(GButton source, GEvent event) {
} 

public void textarea1_change1(GTextArea source, GEvent event) {
} 

public void imgButton1_click1(GImageButton source, GEvent event) {
} 

public void imgButton2_click1(GImageButton source, GEvent event) { 
} 

public void imgButton3_click1(GImageButton source, GEvent event) { 
} 

public void imgButton4_click1(GImageButton source, GEvent event) { 
}  


public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  button1 = new GButton(this, 1189, 0, 90, 30);
  button1.setText("Attack");
  button1.addEventHandler(this, "button1_click1");
  button2 = new GButton(this, 1099, 0, 90, 30);
  button2.setText("Move");
  button2.addEventHandler(this, "button2_click1");
  button3 = new GButton(this, 1099, 30, 90, 30);
  button3.setText("Capture");
  button3.addEventHandler(this, "button3_click1");
  button4 = new GButton(this, 1189, 30, 90, 30);
  button4.setText("Defend");
  button4.addEventHandler(this, "button4_click1");
  button5 = new GButton(this, 1098, 60, 180, 48);
  button5.setText("End Turn");
  button5.addEventHandler(this, "button5_click1");
  textarea1 = new GTextArea(this, 1098, 106, 180, 80, G4P.SCROLLBARS_NONE);
  textarea1.setText("Hi");
  textarea1.setTextEditEnabled(false);
  textarea1.setOpaque(false);
  textarea1.addEventHandler(this, "textarea1_change1");
  imgButton1 = new GImageButton(this, 1074, 298, 100, 121, new String[] { "Warrior_(Civ5).png", "Warrior_(Civ5).png", "Warrior_(Civ5).png" } );
  imgButton1.addEventHandler(this, "imgButton1_click1");
  imgButton2 = new GImageButton(this, 1181, 199, 105, 97, new String[] { "Archer_(Civ5).png", "Archer_(Civ5).png", "Archer_(Civ5).png" } );
  imgButton2.addEventHandler(this, "imgButton2_click1");
  imgButton3 = new GImageButton(this, 1065, 198, 112, 100, new String[] { "Scout_(Civ5).png", "Scout_(Civ5).png", "Scout_(Civ5).png" } );
  imgButton3.addEventHandler(this, "imgButton3_click1");
  imgButton4 = new GImageButton(this, 1179, 310, 97, 102, new String[] { "Catapult_(Civ5).png", "Catapult_(Civ5).png", "Catapult_(Civ5).png" } );
  imgButton4.addEventHandler(this, "imgButton4_click1");
}


GButton button1; 
GButton button2; 
GButton button3; 
GButton button4; 
GButton button5; 
GTextArea textarea1; 
GImageButton imgButton1; 
GImageButton imgButton2; 
GImageButton imgButton3; 
GImageButton imgButton4; 

