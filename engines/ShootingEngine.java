import java.util.*;

class ShootingEngine {
  List<Shot> shotList = new ArrayList();
  
  void shoot(int x, int y) {
    shotList.add(new Shot(x, y));
  }

  
  void move() {
    for(int i = 0; i < shotList.size(); i++) {
      Shot shot = shotList.get(i);
      shot.move();
      if(shot.hasHitTarget()) {
        shotList.remove(i);
      }
    }
  }
  
  List<Shot> getShotList() {
    return shotList;
  }
}
