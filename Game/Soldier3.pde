class Soldier3 extends Entity {
  
  Soldier3(String path, String walking[], String attacking[], int width, int height, boolean enemy, Base b1, Base b2, float diff, ArrayList<Entity> soldiers, Sound sound, int volumes[]) 
  {
    super(path, walking, attacking, width, height, enemy, b1, b2, soldiers, sound, volumes);
    life = 200;
    damage = 2;
    price = 150;
    drop = 125;
    distance = 25;
    if (enemy) 
    {
      speed = new PVector(-5, 0);
      damage *= diff * base2.boost3;
      life *= diff * base2.boost3;
    } 
    else 
    {
     speed = new PVector(5, 0);
     damage *= base1.boost3;
     life *= base1.boost3;
    }
  }
  
  void update()
  {
   super.update(3); 
  }
  
}
