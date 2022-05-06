class Player {
  final float AMOUNT_MOVEMENT = 4;
  float x;
  final float y = height - 40;
  float velX;
  boolean alive = true;
  final float w=26, h=8;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  int shotInterval = 30;
  int lastShotFired = -shotInterval;
  
  void draw() {
    fill(255, 255, 255);
    //noStroke();
    rect(x, y, w, h);
  }

  void updatePosition() {
    x+=velX;
  }

  void checkWallCollision() {
    if (x<0) x=0;
    if (x+w > width) x=width-w;
  }

  void moveRight() {
    velX=+AMOUNT_MOVEMENT;
  }
  void moveLeft() {
    velX=-AMOUNT_MOVEMENT;
  }
  
  void shot(){
    if(frameCount - lastShotFired > shotInterval){
      Bullet newBullet = new Bullet(x+w/2, y-5, Direction.UP);
      bullets.add(newBullet);
      lastShotFired = frameCount;
    }
  }
}
