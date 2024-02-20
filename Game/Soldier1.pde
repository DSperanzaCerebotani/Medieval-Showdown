class Soldier1 extends Entity 
{
  
  Soldier1(String path, String walking[], String attacking[], int width, int height, boolean enemy, Base b1, Base b2, float diff, ArrayList<Entity> soldiers, Sound sound, int volumes[]) 
  {
    super(path, walking, attacking, width, height, enemy, b1, b2, soldiers, sound, volumes);
    life = 400;
    damage = 5;
    price = 100;
    drop = 80;
    distance = 25;
    if (enemy) 
    {
      speed = new PVector(-3, 0);
      damage *= diff * base2.boost1;
      life *= diff * base2.boost1;
    } 
    else 
    {
     speed = new PVector(3, 0);
     damage *= base1.boost1;
     life *= base1.boost1;
    }
  }
  
  void update()
  {
   super.update(1); 
  }

}
