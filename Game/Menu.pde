class Menu
{
  ArrayList<Sound> sounds;
  Timer timerlight;
  Timer timererror;
  String items[];
  PVector position;
  int size;
  color fill;
  color selectedFill;
  PFont font;
  int ex;
  int ey;
  int index;
  int keybinds[];
  int otherKeys[];
  int volumes[];
  boolean keys;
  boolean waiting;
  boolean used;
  boolean error;
  boolean volume;
  Key up;
  Key down;
  
  Menu(String path, String items[], int volumes[])
  {
    volume = true;
    this.volumes = volumes;
    ex = 0;
    ey = 0;
    error = false;
    keys = false;
    this.items = items;
    position = new PVector();
    size = 20;
    fill = 0;
    selectedFill = 255;
    font = createFont(path, size);
    index = 0;
    up = new Key(UP);
    down = new Key(DOWN);
  }
  
  Menu(String path, String items[])
  {
   ex = 0;
   ey = 0;
   error = false;
   keys = false;
   this.items = items;
   position = new PVector();
   size = 20;
   fill = 0;
   selectedFill = 255;
   font = createFont(path, size);
   index = 0;
   up = new Key(UP);
   down = new Key(DOWN);
  }
  
  Menu(String path, String items[], int keybinds[], int otherKeys[], ArrayList<Sound> sounds, int volumes[])
  {
   this.sounds = sounds;
   this.volumes = volumes;
   ex = 0;
   ey = 0;
   error = false;
   timererror = new Timer(12);
   timerlight = new Timer(12);
   waiting = false;
   keys = true;
   this.otherKeys = otherKeys;
   this.keybinds = keybinds;
   this.items = items;
   position = new PVector();
   size = 20;
   fill = 0;
   selectedFill = 255;
   font = createFont(path, size);
   index = 0;
   up = new Key(UP);
   down = new Key(DOWN);
  }
  
  int[] getKeybinds()
  {
    return keybinds;
  }
  
  void draw()
  {
   if (keys)
   {
     timerlight.update();
     timerlight.tick();
   }
   float y = position.y;
   textFont(font);
   textSize(size);
   for (int i=0; i<items.length; i++)
   {
     if (i == index)
     {
      if (error)
      {
       fill(196, 30, 58);
       ex = 8;
       ey = 8;
      }
      else if (keys && timerlight.elapsed <= 6 && waiting)
      {
        fill(fill);
      }
      else
      {
        fill(selectedFill); 
      }
     }
     else
     {
      fill(fill); 
      ex = 0;
      ey = 0;
     }
     text(items[i], position.x + ex, y +ey);
     if (keys)
     {
      text((char)(keybinds[i]), 900 + ex, y + ey); 
     }
     else if (volume)
     {
       text((volumes[i]), 900, y);
     }
     y += size + 10;
   }
  }
  
  void update()
  {
   if (error)
   {
    timererror.update();
    if (timererror.tick())
    {
     error = false; 
    }
   }
   if (up.pressed)
   {
    index--;
    if (index == -1)
    {
     index = items.length - 1; 
    }
    up.pressed = false;
   }
   else if (down.pressed)
   {
    index++;
    if (index == items.length)
    {
     index = 0; 
    }
    down.pressed = false;
   }
  }
  
  void keyPressed(int key)
  {
     if (!error)
     {
     up.keyPressed(key);
     down.keyPressed(key);
     if (keys)
     {
       if (key == 10)
       {
          waiting = true; 
       }
       else if (((key >= 65 && key <= 90) || (key >= 48 && key <= 57)) && waiting)
       {
         used = false;
         for (int i=0; i<9; i++)
         {
          if (key == keybinds[i] || key == otherKeys[i])
          {
            used = true;
          }
         }
         if (!used)
         {
           keybinds[index] = key; 
         }
         else 
         {
           error = true;
           sounds.get(2).play();
           sounds.get(2).amp((volumes[0]/10.0) * (volumes[2] / 10.0));
           waiting = false;
         }
         waiting = false;
       }
       else if (waiting)
       {
         error = true;
         waiting = false;
       }
       else
       {
        waiting = false; 
       }
     }
     else if (volume)
     {
      if (key == 521)
      {
       volumes[index] = constrain((volumes[index] + 1), 1, 10); 
      }
      else if (key == 45)
      {
        volumes[index] = constrain((volumes[index] - 1), 1, 10);
      }
     }
    }
  }
}
