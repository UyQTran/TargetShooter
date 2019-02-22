class Shot {
  int x, y;
  boolean hasHitTarget;
  int speed = 50;
  int size = 100;
  int shrinkSpeed = 10;
  int targetY;
  
  Shot(int x, int y) {
    this.x = x;
    this.y = y + 450;
    targetY = y;
  }
  
  void move() {
    y -= speed;
    size -= shrinkSpeed;
    if(y <= targetY) {
      hasHitTarget = true;
    }
    
  }
  
  boolean hasHitTarget() {
    return hasHitTarget;
  }
}
