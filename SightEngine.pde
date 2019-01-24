class SightEngine {
  int x = 500;
  int y = 500;
  int speed = 10;
  boolean 
  
  void down() {
    if(y < 1080) {
      y += speed;
    }
  }
  
  void up() {
    if(y > 0) {
      y -= speed;
    }
  }
  
  void left() {
    if(x > 0) {
      x -= speed;
    }
  }
  
  void right() {
    if(x < 1920) {
      x += speed;
    }
  }
}
