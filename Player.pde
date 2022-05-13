
class Player extends Movil {
  boolean alive = true;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  int shotInterval = 30;
  int lastShotFired = -shotInterval;
  SoundFile sound;
  
  Player(spaceInvaders context){
    y = height - 40;
    w=26;
    h=8;
    sound = new SoundFile(context, "assets/laser.mp3");
  }
  
  void draw() {
    fill(255, 255, 255);
    noStroke();
    rect(x, y, w, h);
    triangle(x+w/2-5, y  ,  x+w/2+5, y   , x+w/2, y-5  );
  }


  void checkWallCollision() {
    if (x<0) x=0;
    if (x+w > width) x=width-w;
  }

  
  void shot(){
    if(frameCount - lastShotFired > shotInterval){
      Bullet newBullet = new Bullet(x+w/2, y-5, Direction.UP);
      bullets.add(newBullet);
      lastShotFired = frameCount;
      sound.play();
    }
  }
}
