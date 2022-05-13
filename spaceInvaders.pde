import processing.sound.*;

import java.util.stream.Collectors;

Player player;
ArrayList<Alien> aliens;

SoundFile soundExplosion;

void setup() {
  size(800, 300);

  soundExplosion = new SoundFile(this, "assets/explosion.mp3");
  player = new Player(this);
  aliens = new ArrayList<Alien>();

  for (int i=0; i<9; i++) {
    aliens.add(new AlienA( i*60+10, 10));
  }

  for (int i=0; i<5; i++) {
    aliens.add(new AlienB( i*60+10, 40));
  }

  for (int i=0; i<5; i++) {
    aliens.add(new AlienC( i*60+10, 80));
  }
}

void draw() {
  //Borramos pantalla
  background(0, 0, 0);

  /////////// Gestionar el player

  //Chequeamos si colisiona con paredes laterales
  player.checkWallCollision();
  //Actualizamos posición del player
  player.updatePosition();
  //Dibujamos player
  player.draw();




  //Para cada disparo del player
  for (Bullet bullet : player.bullets) {
    //  actualizado su posición del disparo
    bullet.updatePosition();
    //  dibujamos el disparo
    bullet.draw();
  }




  //////Gestión de los disparo fuera de pantalla
  //Si el disparo del player sale fuera de la pantalla, lo borramos
  /*for(Bullet bullet: player.bullets){
   if(bullet.checkWallCollision()){
   player.bullets.remove(bullet);
   break;
   }
   }*/

  player.bullets =(ArrayList) player.bullets.stream()
    .filter( bullet -> !bullet.checkWallCollision() )
    .collect(Collectors.toList());

  for (Alien alien : aliens) {
    alien.bullets =(ArrayList) alien.bullets.stream()
      .filter( bullet -> !bullet.checkWallCollision() )
      .collect(Collectors.toList());
  }



  //  chequeamos si hay colisión entre el disparo mas antiguo y la nave
  //    en caso afirmativo borramos la nave y el disparo

  //////Chequeamos si el disparo mas antiguo (del de más arriba) del jugador colisiona con alguna nave nave
  //Si hay disparos, obtenemos el disparo mas antiguo
  if (player.bullets.size() > 0) {
    Bullet oldShot = player.bullets.get(0);
    //Para cada nave
    for (Alien alien : aliens) {
      if ( collideRectRect(oldShot.x, oldShot.y, oldShot.w, oldShot.h,
        alien.x, alien.y, alien.w, alien.h) ) {
        soundExplosion.play();
        aliens.remove(alien);
        player.bullets.remove(player.bullets.get(0));

        break;
      }
    }
  }


  //// Controlamos del juego ganado
  //Si no hay naves, has ganado

  //////Chequeamos si algún disparo de alguna de las nave colisiona con el jugador
  //para cada nave
  //  y para cada disparo de cada nave
  //    chequeamos si colisiona el disparo con el jugador
  for (Alien alien : aliens) {
    for (Bullet bullet : alien.bullets) {
      if (collideRectRect(bullet.x, bullet.y, bullet.w, bullet.h,
        player.x, player.y, player.w, player.h)) {
        showMessage("GAME OVER", color(255, 0, 0));
        frameRate(0);
      }
    }
  }

  //////Chequeamos si alguna nave colisiona con el jugador
  //para cada nave
  //  chequeamos si colisiona con el jugador
  for (Alien alien : aliens) {
    if (collideRectRect(alien.x, alien.y, alien.w, alien.h,
      player.x, player.y, player.w, player.h) || alien.y+alien.h >= height) {
      showMessage("GAME OVER", color(255, 0, 0));
      frameRate(0);
    }
  }





  //////Controlamos el movimiento de la nave
  // Para cada nave, determinamos si choca contra la izq o la derecha de la pantalla
  // Si hay colisión con la derecha
  //  cambiamos la dirección de todas las naves a la izquierda
  // Si hay colisión con la izquierda
  //  cambiamos la dirección de todas las naves a la derecha
  // bajamos un poco todas las naves
  boolean colisionRight = false;
  boolean colisionLeft = false;
  for (Alien alien : aliens) {
    if (alien.x + alien.velX + alien.w  > width) {  //pared derecha
      colisionRight=true;
      break;
    }
    if (alien.x + alien.velX < 0) {  // pared izquierda
      colisionLeft=true;
      break;
    }
  }

  if (colisionRight == true) {
    for (Alien alien : aliens) {
      alien.moveLeft();
      alien.moveDown();
    }
  }

  if (colisionLeft == true) {
    for (Alien alien : aliens) {
      alien.moveRight();
      alien.moveDown();
    }
  }

  /////////// Gestionar las naves
  //Para cada nave del juego

  for (Alien alien : aliens) {
    //  Actualizamos posición de la nave
    alien.updatePosition();
    //  Dibujamos la nave
    alien.draw();
  }
  //  decidimos de forma random si tiene que disparar
  //  Para cada disparo de la nave
  //    actualizado su posición del disparo
  //    dibujamos el disparo
  for (Alien alien : aliens) {
    if ((int)random(600) == 1) alien.shot();

    for (Bullet bullet : alien.bullets) {
      bullet.updatePosition();
      bullet.draw();
    }
  }

  if (aliens.size() == 0) {
    showMessage("GALAXIA SALVADA", color(0, 255, 0));
  }
  //////Controlamos la puntuación
  //Mostramos puntos en pantalla
}

boolean collideRectRect( float xa, float ya, float wa, float ha,
  float xb, float yb, float wb, float hb ) {
  return xa+wa >= xb && xa <=  xb+wb && ya+ha >= yb  && ya <= yb+hb;
}

void mouseMoved() {
  player.x=mouseX-player.w/2;

  /*float dist = mouseX-player.x;
   if(dist > 0) player.moveRight();
   else player.moveLeft();*/
}

void mousePressed() {
  player.shot();

}


void showMessage(String msg, color c) {
  textSize(56);
  textAlign(CENTER);
  fill(c);
  textWidth(msg);
  text(msg, width/2, height/2);
}
