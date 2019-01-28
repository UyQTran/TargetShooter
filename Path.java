class Path {
  List<Vertex> vertexList = new ArrayList();
  
  void addCoordinate(int x, int y, int speed) {
    vertexList(new Vertex(x, y, speed));
  }
  
  class Vertex {
    int x, y, speed;
    
    Vertex(int x, int y, int speed) {
      this.x = x;
      this.y = y;
      this.speed = speed;
    }
  }
}
