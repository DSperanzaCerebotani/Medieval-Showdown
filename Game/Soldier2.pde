class Soldier2 extends Entity {
  
  Soldier2(String path, String walking[], String attacking[], int width, int height, boolean enemy, Base b1, Base b2, float diff, ArrayList<Entity> soldiers, Sound sound, int volumes[]) 
  {
    super(path, walking, attacking, width, height, enemy, b1, b2, soldiers, sound, volumes);
    life = 150;
    damage = 2;
    price = 150;
    drop = 125;
    distance = 300;
    if (enemy) 
    {
      speed = new PVector(-3, 0);
      damage *= diff * base2.boost2;
      life *= diff * base2.boost2;
    } 
    else 
    {
     speed = new PVector(3, 0);
     damage *= base1.boost2;
     life *= base1.boost2;
    }
  }
  
  void update()
  {
   super.update(2); 
  }
  
}
