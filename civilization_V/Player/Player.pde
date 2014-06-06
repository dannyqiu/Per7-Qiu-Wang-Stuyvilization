public class Player{
   ArrayList<Unit> OwnedUnits;
   ArrayList<Resource> OwnedResources; 
   ArrayList<Tile> OwnedTiles;
   int gold;
  
 public Player(){
   gold = 100;
   OwnedUnits = new ArrayList<Unit>();
   OwnedResources = new ArrayList<Resource>();
   OwnedTiles = new ArrayList<Tile>();
}

void newTurn(){
for (Resource x : OwnedResources){
  gold += x.getValue();
}
for (Tile x : OwnedTiles){
  gold += x.getValue();
}
}

void BuildUnit(int i){
OwnedUnits.add (Units.get(i));
gold -= Units.get(i).getCost();
}


}
