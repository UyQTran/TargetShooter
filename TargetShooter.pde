import java.util.*;

BackgroundEngine backgroundEngine = new BackgroundEngine();
Sight sight = new Sight();
int frameCounter = 0;
Set<Integer> keyPressed = new HashSet();  
ShootingEngine shootingEngine = new ShootingEngine();
TargetEngine targetEngine = new TargetEngine();
boolean shootFirstPress = true;

void setup() {
  frameRate(60);
  size(1280, 720);
  targetEngine.levelUp();
}

void draw() {
  drawBackground();
  drawTargets();
  drawSight();
  drawShots();
  shootingEngine.move();
  targetEngine.move();
  
  frameCounter++;
  if(frameCounter % 60 == 0) {
    targetEngine.incrementGameTime();
    backgroundEngine.changeAlpha();
    frameCounter = 0;
  }
  
  if(keyPressed.contains(37)) {//left
    sight.left();
  }
  if(keyPressed.contains(39)) {//right
    sight.right();
  }
  if(keyPressed.contains(38)) {//up
    sight.up();
  }
  if(keyPressed.contains(40)) {//down
    sight.down();
  }
}

void keyPressed() {
  keyPressed.add(keyCode);
  if(keyCode == 32) {//space
    if(shootFirstPress) {
      shootingEngine.shoot(sight.x, sight.y);
    }
    shootFirstPress = false;
  }
}

void keyReleased() {
  keyPressed.remove(keyCode);
  if(keyCode == 32) {
    shootFirstPress = true;
  }
}

void drawTargets() {
  List<Target> targetList = targetEngine.getTargetList();
  
  for(Target target : targetList) {
    fill(255,0,0);
    ellipse(target.currentX, target.currentY, 50, 50);
    fill(255,255,255);
    ellipse(target.currentX, target.currentY, 40, 40);
    fill(255,0,0);
    ellipse(target.currentX, target.currentY, 30, 30);
    fill(255,255,255);
    ellipse(target.currentX, target.currentY, 20, 20);
    fill(255,0,0);
    ellipse(target.currentX, target.currentY, 10, 10);
  }
}

void drawShots() {
  List<Shot> shotList = shootingEngine.getShotList();
  noStroke();
  fill(255, 255, 0);
  
  for(Shot shot : shotList) {
    ellipse(shot.x, shot.y, shot.size, shot.size);
  }
}

void drawSight() {
  noFill();
  stroke(230, 20, 20);
  strokeWeight(4);
  ellipse(sight.x, sight.y, sight.innerSize, sight.innerSize);
  ellipse(sight.x, sight.y, sight.outerSize, sight.outerSize);
  line(sight.x-12, sight.y-12, sight.x-22, sight.y-22);
  line(sight.x+12, sight.y+12, sight.x+22, sight.y+22);
  line(sight.x+12, sight.y-12, sight.x+22, sight.y-22);
  line(sight.x-12, sight.y+12, sight.x-22, sight.y+22);
  line(sight.x-40, sight.y, sight.x-60, sight.y);
  line(sight.x+40, sight.y, sight.x+60, sight.y);
  line(sight.x, sight.y-40, sight.x, sight.y-60);
  line(sight.x, sight.y+40, sight.x, sight.y+60);
}

void drawBackground() {
  background(backgroundEngine.backgroundRed, backgroundEngine.backgroundGreen, backgroundEngine.backgroundBlue);
  drawAllStars();
}

void drawStar(int x, int y) {
  noStroke();
  fill(backgroundEngine.starRed, backgroundEngine.starGreen, backgroundEngine.starBlue, backgroundEngine.starAlpha);
  beginShape();
  vertex(x-5, y-5);
  vertex(x, y-15);
  vertex(x+5, y-5);
  vertex(x+15, y-2);
  vertex(x+5, y+2);
  vertex(x+8, y+12);
  vertex(x, y+5);
  vertex(x-8, y+12);
  vertex(x-5, y+2);
  vertex(x-15, y-2);
  endShape(CLOSE);
}

void drawAllStars() {
  drawStar(50,50);
}
