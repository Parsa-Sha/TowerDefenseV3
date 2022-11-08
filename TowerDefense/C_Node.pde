//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to 
//the node's instructions. 

class Node {
  
  float x, y, vx, vy;
  
  Node(float X, float Y, float Vx, float Vy) {
    x = X;
    y = Y;
    vx = Vx;
    vy = Vy;
  }
  
}
