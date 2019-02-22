import java.util.*;

class Path {
  List<Vertex> vertexList = new ArrayList();
  
  void addCoordinate(int x, int y, int speed) {
    vertexList.add(new Vertex(x, y, speed));
  }
  
  Vertex popVertex() {
    return vertexList.remove(0);
  }
}
