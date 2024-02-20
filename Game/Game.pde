import processing.sound.*;

SceneManager sceneManager;
boolean setupFinish;
PImage loadingImage;

/**
Inizializza la finestra all'avvio del programma.
*/
void settings() 
{
  size(GAME_WIDTH, GAME_HEIGHT);
  //fullScreen();
}

/**
Inizializza la finestra e la schermata di caricamento all'avvio del programma.
*/
void setup() 
{
  windowTitle(GAME_TITLE);
  windowResizable(false);
  frameRate(FRAME_RATE);
  loadingImage = loadImage(ASSET_SCHERMATACARICAMENTO);
  background(loadingImage);
  setupFinish = false;
}

/**
Inizializza i suoni e sceneManager.
*/
void heavyLoad()
{
  ArrayList<Sound> sounds = new ArrayList<Sound>();
  sounds.add(new Sound(this, ASSET_MENUMUSIC));
  sounds.add(new Sound(this, ASSET_BATTLEMUSIC));
  sounds.add(new Sound(this, ASSET_ERRORSOUND));
  sounds.add(new Sound(this, ASSET_SOUNDSOLDIER1));
  sounds.add(new Sound(this, ASSET_SOUNDSOLDIER2));
  sounds.add(new Sound(this, ASSET_SOUNDSOLDIER3));
  sounds.add(new Sound(this, ASSET_SOUNDSOLDIER4));
  sounds.add(new Sound(this, ASSET_VICTORYSOUND));
  sounds.add(new Sound(this, ASSET_DEFEATSOUND));
  sounds.add(new Sound(this, ASSET_BARBIESONG));
  sceneManager = new SceneManager(sounds);
}

/**
Esegue heavyLoad se non è stato ancora eseguito e aggiorna lo stato degli oggetti.
*/
void update() 
{
  if (!setupFinish)
  {
    heavyLoad();
    setupFinish = true;
  }
  sceneManager.update();
}

/**
Disegna gli oggetti.
*/
void draw() 
{
  update();
  sceneManager.draw();
}

/**
Gestisce l'evento keyReleased della tastiera.
*/
void keyReleased()
{
 sceneManager.keyPressed(keyCode); 
}
