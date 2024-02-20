class Soldier4 extends Entity {
  
  Soldier4(String path, String walking[], String attacking[], int width, int height, boolean enemy, Base b1, Base b2, float diff, ArrayList<Entity> soldiers, Sound sound, int volumes[]) 
  {
    super(path, walking, attacking, width, height, enemy, b1, b2, soldiers, sound, volumes);
    life = 800;
    damage = 10;
    price = 500;
    drop = 450;
    distance = 50;
    if (enemy) 
    {
      speed = new PVector(-2, 0);
      damage *= diff * base2.boost4;
      life *= diff * base2.boost4;
    } 
    else 
    {
     speed = new PVector(2, 0);
     damage *= base1.boost4;
     life *= base1.boost4;
    }
  }
  
  void update()
  {
   super.update(4); 
  }
  
}
