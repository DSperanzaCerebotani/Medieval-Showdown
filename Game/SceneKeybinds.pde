class SceneKeybinds
{
 Background background;
 Menu menu;
 int keybinds[];
 int otherKeys[];
 int nplayer;
 
 SceneKeybinds(int keybinds[], int otherKeys[], int nplayer, ArrayList<Sound> sounds, int volumes[])
 {
  this.nplayer = nplayer;
  this.keybinds = keybinds;
  this.otherKeys = otherKeys;
  String items[] = { "Evoca fanteria leggera:", "Evoca tiratore:", "Evoca anti-fanteria pesante:", "Evoca fanteria pesante:", "Potenziamento economia:",
                     "Potenziamento fanteria leggere:", "Potenziamento tiratori:", "Potenziamento anti-fanteria pesante:", "Potenziamento fanteria pesante:"};
  
  background = new Background(ASSET_MENUBACKGROUND, GAME_WIDTH, GAME_HEIGHT);
  menu = new Menu(ASSET_FONTMENU, items, keybinds, otherKeys, sounds, volumes);
  menu.position = new PVector(100, 100);
  menu.fill = color(255, 255, 0);
  menu.size = 50;
 }
 
 int[] getKeybinds()
 {
   return keybinds;
 }
 
 void initialize()
 {
  menu.index = 0; 
 }
 
 void update()
 {
  menu.update(); 
  keybinds = menu.getKeybinds();
 }
 
 void draw()
 {
  background.draw();
  menu.draw();
 }
 
}
