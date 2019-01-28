import java.util.*;
import java.io.*;

class TargetEngine {
  List<Target> targetList = new ArrayList();
  List<String> levelList = new ArrayList();
  int currentLevel = 0;
  
  TargetEngine() {
    try {
      Scanner levelScanner = new Scanner(new FileReader("levelList.txt"));
      while (levelScanner.hasNext()) {
        levelList.add(levelScanner.nextLine());
      }
    } catch(Exception e) {
      
    }
  }
  
  void levelUp() {
    targetList.clear();
    try {
      Scanner targetScanner = new Scanner(new FileReader(levelList.get(currentLevel)));
      while(targetScanner.hasNext()) {
        String[] targetLine = targetScanner.nextLine().split(" ");
        Path targetPath = new Path();
        for(int i = 2; i < targetLine.length; i += 3) {
          int x = Integer.parseInt(targetLine[i]);
          int y = targetLine[i+1].parseInt();
          int speed = targetLine[i+2].parseInt();
          targetPath.addCoordinate(x, y, speed);
          
        }
        int spawnTime = targetLine[0].parseInt();
        int points = targetLine[1].parseInt();
        
        targetList.add(new Target(targetPath));
      }
    } catch(Exception e) {
    
    }
    currentLevel++;
  }
}
