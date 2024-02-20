enum SceneType {SceneMain, ScenePlay, SceneDifficulty, ScenePlayer, SceneKeybinds, SceneAudioSettings};

class SceneManager
{
 ArrayList<Sound> sounds;
 SceneMain sceneMain;
 ScenePlay scenePlay;
 SceneDifficulty sceneDifficulty;
 ScenePlayer scenePlayer;
 SceneKeybinds sceneKeybinds;
 SceneAudioSettings sceneAudioSettings;
 SceneType active;
 Key enter;
 Key ret;
 Key back;
 int keybinds1[];
 int keybinds2[];
 int volumes[];
 
 
 SceneManager(ArrayList<Sound> sounds)
 {
  this.sounds = sounds;
  volumes = loadIntArray("assets/volumes.txt");
  scenePlayer = new ScenePlayer();
  sceneMain = new SceneMain();
  sceneDifficulty = new SceneDifficulty();
  active = SceneType.SceneMain;
  enter = new Key(ENTER);
  back = new Key(BACKSPACE);
  keybinds1 = loadIntArray("assets/keybinds1.txt");
  keybinds2 = loadIntArray("assets/keybinds2.txt");
  sounds.get(0).loop();
 }
 
 void saveIntArray(int[] array, String filename) 
 {
  String[] stringArray = new String[array.length];
  for (int i = 0; i < array.length; i++) 
  {
    stringArray[i] = str(array[i]);
  }
  saveStrings(filename, stringArray);
 }
 
 int[] loadIntArray(String filename) 
 {
  String[] stringArray = loadStrings(filename);
  int[] array = new int[stringArray.length];
  for (int i = 0; i < stringArray.length; i++) 
  {
    array[i] = int(stringArray[i]);
  }
  return array;
}

 
 void update()
 {
  if (back.pressed)
  {
   if (active == SceneType.SceneDifficulty || active == SceneType.ScenePlayer || active == SceneType.SceneAudioSettings)
   {
     sceneMain.initialize();
     active = SceneType.SceneMain;
   }
   else if (active == SceneType.ScenePlay)
   {
     sceneDifficulty.initialize();
     active = SceneType.SceneDifficulty;
     if (sounds.get(7).isPlaying())
     {
      sounds.get(7).stop(); 
     }
     else if (sounds.get(8).isPlaying())
     {
      sounds.get(8).stop(); 
     }
     sounds.get(1).stop();
     sounds.get(0).loop();
   }
   else if (active == SceneType.SceneKeybinds)
   {
     if (sceneKeybinds.nplayer == 1)
     {
       keybinds1 = sceneKeybinds.getKeybinds();
     }
     else if (sceneKeybinds.nplayer == 2)
     {
       keybinds2 = sceneKeybinds.getKeybinds(); 
     }
     scenePlayer.initialize();
     active = SceneType.ScenePlayer;
   }
   back.pressed = false;
  }
  if (enter.pressed) 
  {
      if (active == SceneType.SceneMain) 
      {   
        if (sceneMain.menu.index == 0) 
        {
          sceneDifficulty.initialize();
          active = SceneType.SceneDifficulty;
        }
        else if (sceneMain.menu.index == 1)
        {
          scenePlayer.initialize();
          active = SceneType.ScenePlayer;
        }
        else if (sceneMain.menu.index == 2)
        {
          sceneAudioSettings = new SceneAudioSettings(volumes);
          active = SceneType.SceneAudioSettings;
        }
        else if (sceneMain.menu.index == 3)
        {
         saveIntArray(keybinds1, "assets/keybinds1.txt");
         saveIntArray(keybinds2, "assets/keybinds2.txt");
         saveIntArray(volumes, "assets/volumes.txt");
         System.exit(0);
        }
      }
      else if (active == SceneType.SceneDifficulty)
      {
        if (sceneDifficulty.menu.index == 0)
        {
         scenePlay = new ScenePlay(-1, keybinds1, keybinds2, sounds, volumes);
         active = SceneType.ScenePlay;
         sounds.get(0).stop();
         sounds.get(1).loop();
        }
        else if (sceneDifficulty.menu.index == 1)
        {
         link("https://shopping.mattel.com/it-it/collections/barbie");
         sounds.get(9).play();
         sounds.get(9).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
        }
        else if (sceneDifficulty.menu.index == 2)
        {
          scenePlay = new ScenePlay(1.3, keybinds1, keybinds2, sounds, volumes);
          active = SceneType.ScenePlay;
          sounds.get(0).stop();
          sounds.get(1).loop();
        }
        else if (sceneDifficulty.menu.index == 3)
        {
          scenePlay = new ScenePlay(1.8, keybinds1, keybinds2, sounds, volumes);
          active = SceneType.ScenePlay;
          sounds.get(0).stop();
          sounds.get(1).loop();
        }
        else if (sceneDifficulty.menu.index == 4)
        {
          scenePlay = new ScenePlay(2.5, keybinds1, keybinds2, sounds, volumes);
          active = SceneType.ScenePlay;
          sounds.get(0).stop();
          sounds.get(1).loop();
        }
      }
      else if (active == SceneType.ScenePlayer)
      {
         if (scenePlayer.menu.index == 0)
         {
           sceneKeybinds = new SceneKeybinds(keybinds1, keybinds2, 1, sounds, volumes);
           active = SceneType.SceneKeybinds;
         }
         else if (scenePlayer.menu.index == 1)
         {
           sceneKeybinds = new SceneKeybinds(keybinds2, keybinds1, 2, sounds, volumes);
           active = SceneType.SceneKeybinds;
         }
      }
      enter.pressed = false;
    }
    if (active == SceneType.SceneMain) 
    {
      sceneMain.update();
    } 
    else if (active == SceneType.SceneDifficulty)
    {
     sceneDifficulty.update(); 
    }
    else if (active == SceneType.ScenePlayer)
    {
     scenePlayer.update(); 
    }
    else if (active == SceneType.SceneKeybinds)
    {
     sceneKeybinds.update(); 
    }
    else if (active == SceneType.SceneAudioSettings)
    {
     sceneAudioSettings.update(); 
    }
 }
 
 void draw() {
    if (active == SceneType.SceneMain) 
    {
      sceneMain.draw();
      sounds.get(0).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
    }
    else if (active == SceneType.SceneDifficulty)
    {
     sceneDifficulty.draw(); 
     sounds.get(0).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
    }
    else if (active == SceneType.ScenePlayer)
    {
     scenePlayer.draw(); 
     sounds.get(0).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
    }
    else if (active == SceneType.ScenePlay) 
    {
      scenePlay.draw();
      sounds.get(1).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
    }
    else if (active == SceneType.SceneKeybinds)
    {
      sceneKeybinds.draw();
      sounds.get(0).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
    }
    else if (active == SceneType.SceneAudioSettings)
    {
     sceneAudioSettings.draw();
     sounds.get(0).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
    }
    if (sounds.get(9).isPlaying())
    {
      if (active == SceneType.ScenePlay)
      {
        sounds.get(1).amp(0.0001);
      }
      else
      {
        sounds.get(0).amp(0.0001);
      }
    }
  }
  
  void keyPressed(int key) {
    if (active == SceneType.SceneMain) 
    {
     sceneMain.menu.keyPressed(key);
    }
    else if (active == SceneType.SceneDifficulty)
    {
     sceneDifficulty.menu.keyPressed(key); 
    }
    else if (active == SceneType.ScenePlayer)
    {
     scenePlayer.menu.keyPressed(key); 
    }
    else if (active == SceneType.ScenePlay)
    {
     scenePlay.keyPressed(key); 
    }
    else if (active == SceneType.SceneKeybinds)
    {
      sceneKeybinds.menu.keyPressed(key);
    }
    else if (active == SceneType.SceneAudioSettings)
    {
     sceneAudioSettings.menu.keyPressed(key); 
    }
    enter.keyPressed(key);
    back.keyPressed(key);
  }
}
