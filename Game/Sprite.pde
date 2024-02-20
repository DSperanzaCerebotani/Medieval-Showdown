class Sprite {
  
  PImage texture;
  int width;
  int height;
  PVector position;
  PVector speed;
  
  Sprite(String path, int width, int height) 
  {
    this.width = width;
    this.height = height; 
    position = new PVector();
    speed = new PVector();
    texture = loadImage(path);
  }
  
  void update() 
  {
    position.x += speed.x;
    position.y += speed.y;
  }
  
  void draw() {
    image(texture, position.x, position.y, width, height);  
  }
}
