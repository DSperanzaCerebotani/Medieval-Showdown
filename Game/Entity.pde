/**
Classe per la gestione di un'entità.
*/
class Entity extends Sprite 
{
  Sound sound;
  ArrayList<Entity> soldiers;
  Base base1;
  Base base2;
  boolean enemy;
  boolean idle = false;
  boolean combat = false;
  boolean lastCombat;
  boolean arlAttacked;
  int volumes[];
  float life;
  float damage;
  int price;
  int drop;
  int distance;
  int frames = 0;
  char frame = 'i';
  PImage walking[];
  PImage attacking[];
  PImage waiting = new PImage();
  Timer timer;
  int oWidth;
  
  /**
  Crea un nuovo oggetto Entity.
  - path: percorso della risorsa.
  - walking: sprite dell'animazione della camminata.
  - attacking: sprite dell'animazione dell'attacco.
  - width: larghezza dello sfondo.
  - height: altezza dello sfondo.
  - enemy: alleato o nemico.
  - base1: base 1.
  - base2: base 2.
  - soldiers: entità attive nel gioco.
  - sound: suono da riprodurre.
  - volumes: volumi del suono.
  */
  Entity(String path, String walking[], String attacking[], int width, int height, boolean enemy, Base base1, Base base2, ArrayList<Entity> soldiers, Sound sound, int volumes[]) 
  {
    super(path, width, height);
    this.oWidth = width;
    this.volumes = volumes;
    this.sound = sound;
    this.soldiers = soldiers;
    this.base1 = base1;
    this.base2 = base2;
    this.enemy = enemy;
    waiting = loadImage(path);
    this.walking = new PImage[5];
    this.attacking = new PImage[5];
    for (int i = 0; i < 5; i++)
    {
      this.walking[i] = loadImage(walking[i]);
    }
    for (int i = 0; i < 5; i++)
    {
      this.attacking[i] = loadImage(attacking[i]);
    }
    if (enemy) 
    {
      position = new PVector(1600, 860);
    } 
    else 
    {
      position = new PVector(200, 860);
    }
    timer = new Timer(2);
    lastCombat = false;
  }
  
  /**
  Verifica la distanza tra due entità
  - s: entità con la quale verificare la distanza.
  - ritorna la distanza tra le due entità.
  */
  int getDistance(Entity s)
  {
    if (position.x > s.position.x)
    {
     return (int)(position.x - (s.position.x + s.width));
    }
    else
    {
      return (int)(s.position.x - (position.x + width));
    }
  }
  
  /**
  Aggiorna lo stato dell'entità
  */
  void update(int s) {
    
    width = oWidth;
    
    timer.update();
    
    arlAttacked = false;
    idle = false;
    combat = false;
    
    if (enemy && position.x <= 360 + distance)
    {
     if (!lastCombat)
     {
      sound.play();
      sound.amp((volumes[0]/10.0) * (volumes[2] / 20.0)); 
     }
     lastCombat = true;
     combat = true;
     arlAttacked = true;
     base1.life -= damage;
     if (base1.life < 0)
     {
       base1.life = 0;
     }
    }
    else if (!enemy && position.x >= 1510 - distance)
    {
      if (!lastCombat)
      {
        sound.play();
        sound.amp((volumes[0]/10.0) * (volumes[2] / 20.0)); 
      }
     lastCombat = true;
     combat = true;
     arlAttacked = true;
     base2.life -= this.damage;
     if (base2.life < 0)
     {
       base2.life = 0;
     }
    }
    
    for (int i=0; i<soldiers.size(); i++) 
    {
      
      if (soldiers.get(i).enemy != enemy) 
      {
        if (getDistance(soldiers.get(i)) <= distance) 
        {
           combat = true;
        }
      }
    }
    if (combat)
    {
      if (!lastCombat)
      {
        sound.play();
        sound.amp((volumes[0]/10.0) * (volumes[2] / 20.0));
      }
      lastCombat = true; 
    }
    else
    {
      lastCombat = false;
    }
    
    if (timer.tick())
    {
      if (combat)
     {
       if (frame != 'c')
       {
         frames = 0;
         frame = 'c';
       }
       if (frames == 4)
       {
         sound.play();
         sound.amp((volumes[0]/10.0) * (volumes[2] / 20.0));
       }
       if (s == 1 && frames == 4)
       {
        width += 10;
       }
       else if (s == 2 && (frames == 0 || frames == 2 || frames == 3 || frames == 4))
       {
        width += 10; 
       }
       else if (s == 3 && frames == 0)
       {
        width += 10; 
       }
       else if (s == 4 && (frames == 0 || frames == 1))
       {
        width += 20; 
       }
       else if (s == 4 && frames == 4)
       {
        width += 10; 
       }
       texture = attacking[frames++];
       frames %= 5;
     }
     else if (idle)
     {
       texture = waiting;
     }
     else
     {
       if (frame == 'w')
       {
         texture = walking[frames++];
         frames %= 5;
       }
       else 
       {
         frames = 0;
         frame = 'w';
         texture = walking[frames++];
       }
     }
    }
    
    if (combat) 
    {
      for (int i=0; i<soldiers.size(); i++) 
      {
       if (soldiers.get(i).enemy != enemy && !arlAttacked) 
       {
         if (getDistance(soldiers.get(i)) <= distance) 
         {
           if (soldiers.get(i).getClass().getName() == "Game$Soldier4" && this.getClass().getName() == "Game$Soldier3")
           {
             soldiers.get(i).life -= (damage * 5.0);
           }
           else if (soldiers.get(i).getClass().getName() == "Game$Soldier3" && this.getClass().getName() == "Game$Soldier4") 
           {
             soldiers.get(i).life -= (damage / 5.0);
           }
           else if (soldiers.get(i).getClass().getName() == "Game$Soldier4" && this.getClass().getName() == "Game$Soldier2")
           {
             soldiers.get(i).life -= (damage / 4.0);
           }
           else
           {
             soldiers.get(i).life -= damage;
           }
          arlAttacked = true;
         }
       }
      }
    } 
    else if (!idle)
    {
      super.update();
    }
  }
  
}
