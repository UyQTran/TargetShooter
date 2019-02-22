class BackgroundEngine {
  int backgroundRed = 0;
  int backgroundGreen = 10;
  int backgroundBlue = 45;
  int starRed = 255;
  int starGreen = 255;
  int starBlue = 0;
  int starAlpha = 255;
  
  void changeAlpha() {
    starAlpha -= 50;
    if(starAlpha < 150) {
      starAlpha = 255;
    }
  }
}
