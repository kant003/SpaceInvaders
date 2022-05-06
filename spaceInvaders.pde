import java.util.stream.Collectors;

Player player;
ArrayList<Alien> aliens;
void setup(){
  size(400,300);
  player = new Player();
  aliens = new ArrayList<Alien>();
  
  for(int i=0; i<5; i++){
    aliens.add(new Alien( i*60+10,  10));
  }
  
  for(int i=0; i<5; i++){
    aliens.add(new Alien( i*60+10,  40));
  }
  
  for(int i=0; i<5; i++){
    aliens.add(new Alien( i*60+10,  80));
  }
  
}

void draw(){
  //Borramos pantalla
  background(0,0,0);

  /////////// Gestionar el player
  
  //Chequeamos si colisiona con paredes laterales
  player.checkWallCollision();
  //Actualizamos posición del player
  player.updatePosition();
  //Dibujamos player
  player.draw();
  



  //Para cada disparo del player
  for(Bullet bullet: player.bullets){
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
    
  


//////Chequeamos si el disparo mas antiguo (del de más arriba) del jugador colisiona con alguna nave nave
//Si hay disparos, obtenemos el disparo mas antiguo
//Para cada nave
//  chequeamos si hay colisión entre el disparo mas antiguo y la nave
//    en caso afirmativo borramos la nave y el disparo

//// Controlamos del juego ganado
//Si no hay naves, has ganado

//////Chequeamos si algún disparo de alguna de las nave colisiona con el jugador
//para cada nave
//  y para cada disparo de cada nave
//    chequeamos si colisiona el disparo con el jugador


//////Chequeamos si alguna nave colisiona con el jugador
//para cada nave
//  chequeamos si colisiona con el jugador

//////Controlamos el movimiento de la nave
// Para cada nave, determinamos si choca contra la izq o la derecha de la pantalla
// Si hay colisión con la derecha
//  cambiamos la dirección de todas las naves a la izquierda
// Si hay colisión con la izquierda
//  cambiamos la dirección de todas las naves a la derecha
// bajamos un poco todas las naves



  /////////// Gestionar las naves
  //Para cada nave del juego
 
  for(Alien alien: aliens){
    //  Actualizamos posición de la nave
    alien.updatePosition(); 
    //  Dibujamos la nave
    alien.draw();
  }
//  decidimos de forma random si tiene que disparar
//  Para cada disparo de la nave
//    actualizado su posición del disparo
//    dibujamos el disparo


//////Controlamos la puntuación
//Mostramos puntos en pantalla
  
}


void mouseMoved(){
   player.x=mouseX;
   
   /*float dist = mouseX-player.x;
   if(dist > 0) player.moveRight();
   else player.moveLeft();*/
}

void mouseClicked(){
  player.shot();
}
