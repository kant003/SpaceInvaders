class Alien{
  //TODO soluciona el problema de rendimiento
  PImage img1 = loadImage("assets/alienA1.png");
  PImage img2 = loadImage("assets/alienA2.png");
  
  final float AMOUNT_MOVEMENT = 1;
  float x;
  float y = height - 40;
  float velX;
  boolean alive = true;
  final float w=24, h=17;
  
  Alien(float x, float y){
    this.x=x;
    this.y=y;
  }
  
  
  void draw() {
    //fill(255, 255, 255);
    if(Math.round(frameCount/15 % 2) == 0){  // 1,2,3,4,5,6,...
      image(img1, x,y);
    }else{
      image(img2, x,y);
    }
    //noStroke();
    //rect(x, y, w, h);
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
  void moveDown(){
    y+=30; 
  }
}
