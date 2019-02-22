import java.util.*;

class Target {
  int startX, startY, currentX, currentY, targetX, targetY, currentSpeed, currentSpeedX, currentSpeedY, spawnTime, points;
  Path path;
  
  Target(int spawnTime, int points, Path path) {
    this.spawnTime = spawnTime;
    this.points = points;
    this.path = path;
    
    Vertex vertex = path.popVertex();
    this.startX = vertex.x;
    this.startY = vertex.y;
    this.currentX = vertex.x;
    this.currentY = vertex.y;
    this.currentSpeed = vertex.speed;
    this.targetX = this.currentX;
    this.targetY = this.currentY;
  }
  
  void move() {
    if(targetX == currentX && targetY == currentY && path.vertexList.size() > 0) {
      Vertex vertex = path.popVertex();
      
      startX = targetX;
      startY = targetY;
      
      targetX = vertex.x;
      targetY = vertex.y;
      currentSpeed = vertex.speed;
      
      calculateSpeeds();
    }
    
    if(currentX > targetX) {
      currentX -= currentSpeedX;
    }
    if(currentX < targetX) {
      currentX += currentSpeedX;
    }
    if(currentY > targetY) {
      currentY -= currentSpeedY;
    }
    if(currentY < targetY) {
      currentY += currentSpeedY;
    }
  }
  
  void calculateSpeeds() {
    int firstLeg = Math.abs(Math.abs(startX) - Math.abs(targetX));
    int secondLeg = Math.abs(Math.abs(startY) - Math.abs(targetY));
    if(firstLeg == 0) {
      currentSpeedY = currentSpeed;
    } else if(secondLeg == 0) {
      currentSpeedX = currentSpeed;
    } else {
      int hypotenuse = pythagoras(firstLeg, secondLeg);
      
      currentSpeedX = new Double(((double) firstLeg/hypotenuse)*((double) currentSpeed)).intValue()+1;
      currentSpeedY = new Double(((double) secondLeg/hypotenuse)*((double) currentSpeed)).intValue()+1;
      System.out.println(currentSpeedY);
    }
  }
  
  int pythagoras(int firstLeg, int secondLeg) {
    int hypotenuse = (int) Math.sqrt(firstLeg*firstLeg + secondLeg*secondLeg);
    
    return hypotenuse;
  }
}
