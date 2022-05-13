# Sprints

- [x] Conseguir mostrar y mover por pantalla al jugador

- [x] Conseguir mostrar en pantalla las naves enemigas

- [x] Conseguir que el jugador dispare

- [x] Conseguir destruir naves cuando les dispares

- [x] Conseguir que las naves disparen

- [x] Conseguir matar al jugador cuando le disparen

- [x] Mover las naves

- [ ] Conseguir matar al jugador cuando las naves chocan con él

# Pasos del main

//Borramos pantalla
/////////// Gestionar el player
//Actualizamos posición del player
//Dibujamos player
//Chequeamos si colisiona con paredes laterales
//Para cada disparo del player
//	actualizado su posición del disparo
//	dibujamos el disparo

//////Gestión de los disparo fuera de pantalla
//Si el disparo del player sale fuera de la pantalla, lo borramos


//////Chequeamos si el disparo mas antiguo (del de más arriba) del jugador colisiona con alguna nave nave
//Si hay disparos, obtenemos el disparo mas antiguo
//Para cada nave
//	chequeamos si hay colisión entre el disparo mas antiguo y la nave
//		en caso afirmativo borramos la nave y el disparo

//// Controlamos del juego ganado
//Si no hay naves, has ganado

//////Chequeamos si algún disparo de alguna de las nave colisiona con el jugador
//para cada nave
//	y para cada disparo de cada nave
		chequeamos si colisiona el disparo con el jugador


//////Chequeamos si alguna nave colisiona con el jugador
//para cada nave
//	chequeamos si colisiona con el jugador

//////Controlamos el movimiento de la nave
// Para cada nave, determinamos si choca contra la izq o la derecha de la pantalla
// Si hay colisión con la derecha
//	cambiamos la dirección de todas las naves a la izquierda
// Si hay colisión con la izquierda
//	cambiamos la dirección de todas las naves a la derecha
// bajamos un poco todas las naves



/////////// Gestionar las naves
//Para cada nave del juego
//	Actualizamos posición de la nave
//	Dibujamos la nave
//	decidimos de forma random si tiene que disparar
//	Para cada disparo de la nave
//		actualizado su posición del disparo
//		dibujamos el disparo




//////Controlamos la puntuación
//Mostramos puntos en pantalla

