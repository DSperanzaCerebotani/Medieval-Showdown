/**
Classe per la gestione di una base.
*/
class Base extends Sprite 
{
  ArrayList<Sound> sounds;
  ArrayList<Entity> soldiers;
  int volumes[];
  int keybinds1[];
  int keybinds2[];
  int life;
  int money;
  int maxpop;
  int pop;
  boolean enemy;
  Timer timerSpawn;
  int randomSoldier;
  int upMoney;
  int upSoldier1;
  float boost1;
  int upSoldier2;
  float boost2;
  int upSoldier3;
  float boost3;
  int upSoldier4;
  float boost4;
  float diff;
  Base b1;
  Base b2;
  boolean p2;
  
  /**
  Crea un nuovo oggetto Base.
  - path: percorso della risorsa.
  - width: larghezza dello sfondo.
  - height: altezza dello sfondo.
  - enemy: alleato o nemico.
  - p2: giocatore doppio.
  - diff: difficoltà di gioco.
  - keybinds1: keybinds del giocatore 1.
  - keybinds2: keybinds del giocatore 2.
  - soldiers: entità attive nel gioco.
  - sounds: suoni da riprodurre.
  - volumes: volumi dei suoni.
  */
  Base(String path, int width, int height, boolean enemy, boolean p2, float diff, int keybinds1[], int keybinds2[], ArrayList<Entity> soldiers, ArrayList<Sound> sounds, int volumes[]) 
  {
    super(path, width, height);
    this.volumes = volumes;
    this.sounds = sounds;
    this.soldiers = soldiers;
    this.keybinds1 = keybinds1;
    this.keybinds2 = keybinds2;
    this.diff = diff;
    this.p2 = p2;
    pop = 0;
    maxpop = 10;
    money = 500;
    life = 5000;
    this.enemy = enemy;
    timerSpawn = new Timer(int(random(60, 100)));
    randomSoldier = 1;
    upMoney = 1;
    upSoldier1 = 1;
    upSoldier2 = 1;
    upSoldier3 = 1;
    upSoldier4 = 1;
    boost1 = 1;
    boost2 = 1;
    boost3 = 1;
    boost4 = 1;
    if (diff == 1.8)
    {
      maxpop = 13;
    }
    else if (diff == 2.5)
    {
      maxpop = 15;
    }
  }
  
  /**
  Imposta le due basi.
  */
  public void setBases(Base b)
  {
    if (!enemy)
    {
      b1 = this;
      b2 = b;
    }
    else
    {
     b2 = this;
     b1 = b;
    }
  }
  
  /**
  Aggiorna lo stato della base
  */
  public void update()
  {
    timerSpawn.update();
    if (!p2 && enemy && timerSpawn.tick())
    {
      timerSpawn.setDelay(int(random(90, 130)));
      randomSoldier = int(random(1, 5));
      
      if (randomSoldier == 1 && pop < maxpop)
      {
        soldiers.add(new Soldier1(ASSET_ESOLDIER1, ASSET_ESOLDIER1W, ASSET_ESOLDIER1A, 100, 120, true, b1, b2, diff, soldiers, sounds.get(3), volumes));
        pop++;
      }
      else if (randomSoldier == 2 && pop < maxpop)
      {
        soldiers.add(new Soldier2(ASSET_ESOLDIER2, ASSET_ESOLDIER2W, ASSET_ESOLDIER2A, 100, 120, true, b1, b2, diff, soldiers, sounds.get(4), volumes));
        pop++;
      }
      else if (randomSoldier == 3 && pop < maxpop)
      {
        soldiers.add(new Soldier3(ASSET_ESOLDIER3, ASSET_ESOLDIER3W, ASSET_ESOLDIER3A, 100, 120, true, b1, b2, diff, soldiers, sounds.get(5), volumes));
        pop++;
      }
      else if (randomSoldier == 4 && pop < maxpop -1)
      {
        soldiers.add(new Soldier4(ASSET_ESOLDIER4, ASSET_ESOLDIER4W, ASSET_ESOLDIER4A, 150, 120, true, b1, b2, diff, soldiers, sounds.get(6), volumes));
        pop+=2;
      }
    }
  }
  
  /**
  Gestisce l'evento keyReleased della tastiera.
  */
  public void keyPressed(int key) 
  {
    if (!enemy)
    {
      if (key == keybinds1[0] && money >= 100 && pop < maxpop) 
      {
        soldiers.add(new Soldier1(ASSET_SOLDIER1, ASSET_SOLDIER1W, ASSET_SOLDIER1A, 100, 120, false, b1, b2, diff, soldiers, sounds.get(3), volumes));
        money -= 100;
        pop++;
      } 
      else if (key == keybinds1[1] && money >= 150 && pop < maxpop) 
      {
        soldiers.add(new Soldier2(ASSET_SOLDIER2, ASSET_SOLDIER2W, ASSET_SOLDIER2A, 100, 120, false, b1, b2, diff, soldiers, sounds.get(4), volumes));
        money -= 150;
        pop++;
      } 
      else if (key == keybinds1[2] && money >= 150 && pop < maxpop) 
      {
        soldiers.add(new Soldier3(ASSET_SOLDIER3, ASSET_SOLDIER3W, ASSET_SOLDIER3A, 100, 120, false, b1, b2, diff, soldiers, sounds.get(5), volumes));
        money -= 150;
        pop++;
      } 
      else if (key == keybinds1[3] && money >= 500 && pop < maxpop - 1) 
      {
        soldiers.add(new Soldier4(ASSET_SOLDIER4, ASSET_SOLDIER4W, ASSET_SOLDIER4A, 150, 120, false, b1, b2, diff, soldiers, sounds.get(6), volumes));
        money -= 500;
        pop+=2;
      }
      else if (key == keybinds1[4] && money >= upMoney*500 && upMoney < 4)
      {
        money -= upMoney*500;
        upMoney++;
        maxpop++;
      }
      else if (key == keybinds1[5] && money >= upSoldier1*500 && upSoldier1 < 4)
      {
        money -= upSoldier1*500;
        upSoldier1++;
        boost1+=0.2;
      }
      else if (key == keybinds1[6] && money >= upSoldier2*500 && upSoldier2 < 4)
      {
        money -= upSoldier2*500;
        upSoldier2++;
        boost2+=0.2;
      }
      else if (key == keybinds1[7] && money >= upSoldier3*500 && upSoldier3 < 4)
      {
        money -= upSoldier3*500;
        upSoldier3++;
        boost3+=0.2;
      }
      else if (key == keybinds1[8] && money >= upSoldier4*500 && upSoldier4 < 4)
      {
        money -= upSoldier4*500;
        upSoldier4++;
        boost4+=0.2;
      }
    }
    
    
    if (p2 && enemy)
    {
      if (key == keybinds2[0] && money >= 100 && pop < maxpop) 
      {
        soldiers.add(new Soldier1(ASSET_ESOLDIER1, ASSET_ESOLDIER1W, ASSET_ESOLDIER1A, 100, 120, true, b1, b2, diff, soldiers, sounds.get(3), volumes));
        money -= 100;
        pop++;
      } 
      else if (key == keybinds2[1] && money >= 150 && pop < maxpop) 
      {
        soldiers.add(new Soldier2(ASSET_ESOLDIER2, ASSET_ESOLDIER2W, ASSET_ESOLDIER2A, 100, 120, true, b1, b2, diff, soldiers, sounds.get(4), volumes));
        money -= 150;
        pop++;
      } 
      else if (key == keybinds2[2] && money >= 150 && pop < maxpop) 
      {
        soldiers.add(new Soldier3(ASSET_ESOLDIER3, ASSET_ESOLDIER3W, ASSET_ESOLDIER3A, 100, 120, true, b1, b2, diff, soldiers, sounds.get(5), volumes));
        money -= 150;
        pop++;
      } 
      else if (key == keybinds2[3] && money >= 500 && pop < maxpop - 1) 
      {
        soldiers.add(new Soldier4(ASSET_ESOLDIER4, ASSET_ESOLDIER4W, ASSET_ESOLDIER4A, 150, 120, true, b1, b2, diff, soldiers, sounds.get(6), volumes));
        money -= 500;
        pop+=2;
      }
      else if (key == keybinds2[4] && money >= upMoney*500 && upMoney < 4)
      {
        money -= upMoney*500;
        upMoney++;
        maxpop++;
      }
      else if (key == keybinds2[5] && money >= upSoldier1*500 && upSoldier1 < 4)
      {
        money -= upSoldier1*500;
        upSoldier1++;
        boost1+=0.2;
      }
      else if (key == keybinds2[6] && money >= upSoldier2*500 && upSoldier2 < 4)
      {
        money -= upSoldier2*500;
        upSoldier2++;
        boost2+=0.2;
      }
      else if (key == keybinds2[7] && money >= upSoldier3*500 && upSoldier3 < 4)
      {
        money -= upSoldier3*500;
        upSoldier3++;
        boost3+=0.2;
      }
      else if (key == keybinds2[8] && money >= upSoldier4*500 && upSoldier4 < 4)
      {
        money -= upSoldier4*500;
        upSoldier4++;
        boost4+=0.2;
      }
    }
  }

}
