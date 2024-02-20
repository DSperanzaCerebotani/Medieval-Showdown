/**
Classe per la gestione di un messaggio a schermo.
*/
class HUDMessage
{
 String message;
 int size;
 color colore;
 color coloreScuro;
 PFont font;
 float width;
 
 /**
  Crea un nuovo oggetto HUDMessage.
  - message: messaggio da mostrare a schermo.
  - size: dimensione del messaggio.
  - path: percorso del font.   
  */
 HUDMessage(String message, int size, String path)
 {
   this.message = message;
   this.size = size;
   if (message == "You lost")
   {
     colore = color(210, 43, 43);
     coloreScuro = color(136, 8, 8);
   }
   else
   {
     colore = color(34, 139, 34);
     coloreScuro = color(53, 94, 59);
   }
   font = createFont(path, size);
 }
 
 /**
 Disegna il messaggio.
 */
 void draw()
 {
   textSize(size);
   textFont(font);
   fill(coloreScuro);
   text(message, ((1920 - textWidth(message)) / 2)+6, 300+6);
   fill(colore);
   text(message, (1920 - textWidth(message)) / 2, 300);
 }
}
