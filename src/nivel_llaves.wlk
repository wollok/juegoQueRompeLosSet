import wollok.game.*
import fondo.*
import personajes.*
import elementos.*

object nivelLlaves {			// colisiones, acá sí hacen falta
	method configurate() {
		self.cargarFondo()
		self.cargarPollos()
		self.cargarLlaves()
		
		self.cargarPnj()		 
		self.configurarTeclas()
	}
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompleto.png"))
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="ganamos.png"))
			// después de un ratito ...
			game.schedule(3000, {
				// fin del juego
				game.stop()
			})
		})
	}
	method configurarTeclas() {	
		keyboard.up().onPressDo({tony2.moverseArriba()})			
		keyboard.down().onPressDo({tony2.moverseAbajo()})		
		keyboard.right().onPressDo({tony2.moverseDerecha()})		
		keyboard.left().onPressDo({tony2.moverseIzquierda()})
		keyboard.space().onPressDo({tony2.decirEnergia()})		
	}
	method cargarLlaves() {
		(0 .. 2.randomUpTo(3).truncate(0)).forEach{l => game.addVisual(new Llave())}
	}
	method cargarPollos() {
		(0 .. 1.randomUpTo(6).truncate(0)).forEach{p => game.addVisual(new Pollo())}
	}
	method cargarFondo() {
		game.addVisual(new Fondo(image="fondoCompleto.png"))
	}
	method cargarPnj() {
		game.addVisual(tony2)
	}	
}
