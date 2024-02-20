class ScenePlayer
{
 Background background;
 Menu menu;
 
 ScenePlayer()
 {
  String items[] = {"Player 1", "Player 2"};
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
