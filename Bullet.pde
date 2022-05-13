enum Direction {UP, DOWN};

class Bullet extends Movil{
    
  Bullet(float x, float y, Direction dir){
    this.x=x;
    this.y=y;
    this.velY = dir==Direction.UP?-AMOUNT_MOVEMENT:+AMOUNT_MOVEMENT;
    w=3;
    h=5;
  }
  
  void draw() {
    fill(255, 0, 0);
    //noStroke();
    rect(x, y, w, h);
  }
    
  boolean checkWallCollision() {
     if(y<0) return true;
     if(y-h > height) return true;
     
     return false;
  }
  
}
