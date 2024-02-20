/**
Classe per la gestione di una HUD.
*/
class HUD 
{
  
  Base base;
  PFont font;
  boolean end;
  boolean p2;
  Sprite population;
  
  /**
  Crea un nuovo oggetto HUD.
  - base: base a cui la HUD è assegnata.
  - end: fine partita.
  - p2: giocatore doppio.   
  */
  HUD(Base base, boolean end, boolean p2) 
  {
    this.p2 = p2;
    this.end = end;
    this.base = base;
    font = createFont(ASSET_FONTLIFEANDMONEY, 30);
    population = new Sprite(ASSET_POPULATION, 30, 30);
    if (base.enemy)
    {
      population.position = new PVector(1730, 110);
    }
    else
    {
      population.position = new PVector(80, 110);
    }
  }
  
  /**
  Imposta la fine della partita.
  */
  public void setEnd(boolean end)
  {
    this.end = end;
  }
  
  /**
  Disegna la HUD
  */
  void draw() 
  {
   textSize(30);
   textFont(font);
   fill(255, 255, 255);
   if (!base.enemy) 
   {
     text(base.life + "/5000", 30, 625);
     if (!end)
     {
       textSize(35);
       textFont(createFont(ASSET_FONTLIFEANDMONEY, 35));
       fill(0, 0, 0);
       text("Potenziamento economia", (1920-textWidth("Potenziamento economia"))/2, 200);
       text((base.upMoney-1) + "/3", 60, 200);
       if (base.upMoney != 4)
       {
         text("$" + (500*base.upMoney), 150, 200);
       }
       else
       {
         text("MAX", 150, 200);
       }
       text("Potenziamento fanteria leggera", (1920-textWidth("Potenziamento fanteria leggera"))/2, 250);
       text((base.upSoldier1-1) + "/3", 60, 250);
       if (base.upSoldier1 != 4)
       {
         text("$" + (500*base.upSoldier1), 150, 250);
       }
       else
       {
         text("MAX", 150, 250);
       }
       text("Potenziamento tiratori", (1920-textWidth("Potenziamento tiratori"))/2, 300);
       text((base.upSoldier2-1) + "/3", 60, 300);
       if (base.upSoldier2 != 4)
       {
         text("$" + (500*base.upSoldier2), 150, 300);
       }
       else
       {
         text("MAX", 150, 300);
       }
       text("Potenziamento soldato anti-fanteria pesante", (1920-textWidth("Potenziamento soldato anti-fanteria pesante"))/2, 350);
       text((base.upSoldier3-1) + "/3", 60, 350);
       if (base.upSoldier3 != 4)
       {
         text("$" + (500*base.upSoldier3), 150, 350);
       }
       else
       {
         text("MAX", 150, 350);
       }
       text("Potenziamento fanteria pesante", (1920-textWidth("Potenziamento fanteria pesante"))/2, 400);
       text((base.upSoldier4-1) + "/3", 60, 400);
       if (base.upSoldier4 != 4)
       {
         text("$" + (500*base.upSoldier4), 150, 400);
       }
       else
       {
         text("MAX", 150, 400);
       }
     }
   } 
   else 
   {
     text(base.life + "/5000", 1890 - textWidth("5000/5000"), 625);
     if (p2 && !end)
     {
       textSize(35);
       textFont(createFont(ASSET_FONTLIFEANDMONEY, 35));
       fill(0, 0, 0);
       text((base.upMoney-1) + "/3", 1680, 200);
       if (base.upMoney != 4)
       {
         text("$" + (500*base.upMoney), 1770, 200);
       }
       else
       {
         text("MAX", 1770, 200);
       }
       text((base.upSoldier1-1) + "/3", 1680, 250);
       if (base.upSoldier1 != 4)
       {
         text("$" + (500*base.upSoldier1), 1770, 250);
       }
       else
       {
         text("MAX", 1770, 250);
       }
       text((base.upSoldier2-1) + "/3", 1680, 300);
       if (base.upSoldier2 != 4)
       {
         text("$" + (500*base.upSoldier2), 1770, 300);
       }
       else
       {
         text("MAX", 1770, 300);
       }
       text((base.upSoldier3-1) + "/3", 1680, 350);
       if (base.upSoldier3 != 4)
       {
         text("$" + (500*base.upSoldier3), 1770, 350);
       }
       else
       {
         text("MAX", 1770, 350);
       }
       text((base.upSoldier4-1) + "/3", 1680, 400);
       if (base.upSoldier4 != 4)
       {
         text("$" + (500*base.upSoldier4), 1770, 400);
       }
       else
       {
         text("MAX", 1770, 400);
       }
     }
   }
   textSize(37);
   if (!base.enemy) 
   {
    fill(228, 208, 10);
    text("$" + base.money, 80, 90);
    fill(0, 0, 0);
    text(base.pop + "/" + base.maxpop, 120, 140);
    population.draw();
   } 
   else if (p2)
   {
     fill(228, 208, 10);
     text("$" + base.money, 1840 - textWidth("$10000"), 90);
     fill(0, 0, 0);
     text(base.pop + "/" + base.maxpop, 1770, 140);
     population.draw();
   }
  }
  
}
