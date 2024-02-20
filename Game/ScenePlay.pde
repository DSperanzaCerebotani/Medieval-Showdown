class ScenePlay
{
  ArrayList<Sound> sounds;
  ArrayList<Entity> soldiers = new ArrayList<Entity>();
  Background background;
  Base base1;
  Base base2;
  HUD hud1;
  HUD hud2;
  HUDMessage vittoria;
  Timer timer;
  boolean end;
  boolean p2;
  float diff;
  int keybinds1[];
  int keybinds2[];
  int volumes[];
  Sprite s21;
  Sprite s22;
  Sprite s23;
  Sprite s24;
  Sprite s25;
  Sprite s26;
  
  ScenePlay(float diff, int keybinds1[], int keybinds2[], ArrayList<Sound> sounds, int volumes[])
  {
    s21 = new Sprite(ASSET_SOLDIER4, 150, 120);
    s21.position = new PVector(400, 860);
    s22 = new Sprite(ASSET_SOLDIER4A[0], 170, 120);
    s22.position = new PVector(550, 860);
    s23 = new Sprite(ASSET_SOLDIER4A[1], 170, 120);
    s23.position = new PVector(700, 860);
    s24 = new Sprite(ASSET_SOLDIER4A[2], 150, 120);
    s24.position = new PVector(850, 860);
    s25 = new Sprite(ASSET_SOLDIER4A[3], 150, 120);
    s25.position = new PVector(1000, 860);
    s26 = new Sprite(ASSET_SOLDIER4A[4], 160, 120);
    s26.position = new PVector(1150, 860);
    this.volumes = volumes;
    this.sounds = sounds;
    this.keybinds1 = keybinds1;
    this.keybinds2 = keybinds2;
    end = false;
    
    if (diff == -1)
    {
      p2 = true;
      this.diff = 1;
    } 
    else 
    {
      p2 = false;
      this.diff = diff;
    }
    
    background = new Background(ASSET_BACKGROUND, GAME_WIDTH, GAME_HEIGHT);
  
    base1 = new Base(ASSET_BASE, 650, 450, false, p2, this.diff, keybinds1, keybinds2, soldiers, sounds, volumes);
    base1.position = new PVector(-140, 545);
    base1.speed = new PVector(0, 0);
    
    base2 = new Base(ASSET_EBASE, 650, 450, true, p2, this.diff, keybinds1, keybinds2, soldiers, sounds, volumes);
    base2.position = new PVector(GAME_WIDTH-base2.width+140, 545);
    base2.speed = new PVector(0, 0);
    
    base1.setBases(base2);
    base2.setBases(base1);
    
    hud1 = new HUD(base1, end, p2);
    hud2 = new HUD(base2, end, p2);
    
    vittoria = new HUDMessage("", 1, ASSET_FONTWIN);
    
    timer = new Timer(3);
  }
  
  void update() 
  {
    base1.update();
    base2.update();
    if (!end)
    {
      if (base1.life <= 0)
      {
        end = true;
        if (p2)
        {
         hud1.setEnd(true);
         hud2.setEnd(true);
         vittoria = new HUDMessage("Player 2 won", 200, ASSET_FONTWIN);
         sounds.get(7).play();
         sounds.get(7).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
         sounds.get(1).stop();
        }
        else
        {
          hud1.setEnd(true);
          hud2.setEnd(true);
          vittoria = new HUDMessage("You lost", 200, ASSET_FONTWIN);
          sounds.get(8).play();
          sounds.get(8).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
          sounds.get(1).stop();
        }
      }
      else if (base2.life <= 0)
      {
        end = true;
        if (p2)
        {
         hud1.setEnd(true);
         hud2.setEnd(true);
         vittoria = new HUDMessage("Player 1 won", 200, ASSET_FONTWIN);
         sounds.get(7).play();
         sounds.get(7).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
         sounds.get(1).stop();
        }
        else
        {
          hud1.setEnd(true);
          hud2.setEnd(true);
          vittoria = new HUDMessage("You won", 200, ASSET_FONTWIN);
          sounds.get(7).play();
          sounds.get(7).amp((volumes[0]/10.0) * (volumes[1] / 20.0));
          sounds.get(1).stop();
        }
      }
      for (int i=0; i<soldiers.size(); i++) 
      {
        if (soldiers.get(i).life <= 0) 
        {
          if (soldiers.get(i).enemy) 
          {
            base1.money += soldiers.get(i).drop;
            if (soldiers.get(i).getClass().getName() == "Game$Soldier4")
            {
              base2.pop -= 2;
            }
            else
            {
              base2.pop--;
            }
          }
          else
          {
            base2.money += soldiers.get(i).drop;
            if (soldiers.get(i).getClass().getName() == "Game$Soldier4")
            {
              base1.pop -= 2;
            }
            else
            {
              base1.pop--;
            }
          }
          soldiers.remove(i);
        } 
        else 
        {
          soldiers.get(i).update();
        }
      }
      timer.update();
      if (timer.tick()) 
      {
        base1.money+=base1.upMoney;
        base2.money+=base2.upMoney;
      }
    }
  }
  
  void draw() {
    update();
    background.draw();
    base1.draw();
    base2.draw();
    for (int i=0; i<soldiers.size(); i++)
    {
      soldiers.get(i).draw();
    }
    hud1.draw();
    hud2.draw();
    vittoria.draw();
    /*s21.draw();
    s22.draw();
    s23.draw();
    s24.draw();
    s25.draw();
    s26.draw();*/
  }
  
  void keyPressed(int key) {
    base1.keyPressed(key);
    base2.keyPressed(key);
  }
}
