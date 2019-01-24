BackgroundEngine backgroundEngine = new BackgroundEngine();
int frameCounter = 0;


void setup() {
  frameRate(60);
  size(1920, 1080);
}

void draw() {
  drawBackground();
}

void keyPressed() {
  System.out.println(keyCode);
}

void keyReleased() {
  
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
  drawStar(450,350);
  drawStar(150,950);
  drawStar(850,450);
  drawStar(1150,150);
  drawStar(550,550);
  drawStar(350,1050);
  drawStar(1550,950);
  drawStar(1450,850);
  drawStar(1850,650);
  drawStar(950,950);
  drawStar(1750,150);
}
