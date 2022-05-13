class Movil{
  float AMOUNT_MOVEMENT = 4;
  float x;
  float y;
  float velX;
  float velY;
  float w;
  float h;
  
  void updatePosition() {    x+=velX; y+=velY;   }
  void moveRight() {    velX=+AMOUNT_MOVEMENT;  }
  void moveLeft() {    velX=-AMOUNT_MOVEMENT;  }
  void moveDown(){   y+=30;   }
}
