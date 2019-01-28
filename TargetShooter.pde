import java.util.*;

BackgroundEngine backgroundEngine = new BackgroundEngine();
Sight sight = new Sight();
int frameCounter = 0;
Set<Integer> keyPressed = new HashSet();
ShootingEngine shootingEngine = new ShootingEngine();
boolean shootFirstPress = true;

void setup() {
  frameRate(60);
  size(1280, 720);
}

void draw() {
  drawBackground();
  drawSight();
  drawShots();
  shootingEngine.move();
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
  frameCounter++;
  if(frameCounter > 60) {
    backgroundEngine.changeAlpha();
    frameCounter = 0;
  }
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
