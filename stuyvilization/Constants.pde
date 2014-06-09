public static final int MAP_WIDTH = 1000;
public static final int MAP_HEIGHT = 720;
public static final int TILE_SIZE = 18; // Radius of the Tile

ArrayList<Unit> Units = new ArrayList<Unit>();
ArrayList<Sprite> unitsSprites = new ArrayList<Sprite>();

boolean Player1 = false;
boolean Player2 = false;
int CapitalX = -1;
int CapitalY = -1;

int enemyCapitalX = -1;
int enemyCapitalY = -1;

public static final color LAND_COLOR = #FFDC00;
public static final color WATER_COLOR = #0074D9;
public static final color MOUNTAIN_COLOR = #CCCCCC;
public static final color PATH_COLOR = #FFFFFF;

public static Sprite PLAYER_SETTLER;
public static final color MYTILE_COLOR = #FF0000;
public static final color MYHOME_COLOR = #7FFF00;

public static Sprite ENEMY_SETTLER;
public static final color ENEMYTILE_COLOR = #000000;
public static final color ENEMYHOME_COLOR = #FFFF00;

public static int Turn = 1;
