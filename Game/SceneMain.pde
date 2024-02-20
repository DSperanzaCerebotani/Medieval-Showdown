import ddf.minim.*;
class SceneMain
{
 Background background;
 Menu menu;
 
 SceneMain()
 {
  String items[] = { "Gioca", "Comandi", "Impostazioni audio", "Esci"};
  background = new Background(ASSET_MENUBACKGROUND, GAME_WIDTH, GAME_HEIGHT);
  menu = new Menu(ASSET_FONTMENU, items);
  menu.position = new PVector(100, 100);
  menu.fill = color(255, 255, 0);
  menu.size = 50;
 }
 
 void initialize()
 {
  menu.index = 0; 
 }
 
 void update()
 {
  menu.update(); 
 }
 
 void draw()
 {
  background.draw();
  menu.draw();
 }
 
}
