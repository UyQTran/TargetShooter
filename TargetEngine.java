import java.util.*;
import java.io.*;

class TargetEngine {
  List<Target> targetList = new ArrayList();
  List<String> levelList = new ArrayList();
  int currentLevel = 0;
  int gameTime = 0;
  
  TargetEngine() {
    try {
      Scanner levelScanner = new Scanner(new FileReader("levelList.txt"));
      while (levelScanner.hasNext()) {
        levelList.add(levelScanner.nextLine());
      }
    } catch(Exception e) {
      
    }
  }
  
  void move() {
    for(Target target : targetList) {
      if(target.spawnTime <= gameTime) {
        target.move();
      }
    }
  }
  
  void incrementGameTime() {
    gameTime++;
  }
  
  List<Target> getTargetList() {
    return targetList;
  }
  
  void levelUp() {
    targetList.clear();
    try {
      for(int i = 0; i < new Level().targets.length; i++) {
        String[] targetLine = new Level().targets[i].split(" ");
        System.out.println(targetLine[1]);
        Path targetPath = new Path();
        for(int j = 3; j < targetLine.length; j += 3) {
          int x = Integer.parseInt(targetLine[j]);
          int y = Integer.parseInt(targetLine[j+1]);
          int speed = Integer.parseInt(targetLine[j+2]);
          targetPath.addCoordinate(x, y, speed);
        }
        int spawnTime = Integer.parseInt(targetLine[1]);
        int points = Integer.parseInt(targetLine[2]);
        
        targetList.add(new Target(spawnTime, points, targetPath));
        
      }
    } catch(Exception e) {
    
      System.out.println(e);
    }
    currentLevel++;
  }
}
