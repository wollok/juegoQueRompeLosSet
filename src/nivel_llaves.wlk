import wollok.game.*
import fondo.*
import personajes.*
import elementos.*

object nivelLlaves {			
	method configurate() {
		self.cargarFondo()
		self.cargarPollos()
		self.cargarLlaves()
		game.onTick(2000,"generarSalida",{=>self.cargarSalida()})
		self.perderSiCorresponde()
		self.cargarPnj()		 
		self.cargarColisiones()
		self.configurarTeclas()		
	}
	method ganarSiCorresponde() {
		game.whenCollideDo(tony2,{s => s.terminarJuego()})
	}
	method ganar() {															// es muy parecido al terminar() de nivelBloques, el perder() también va a ser parecido
		game.clear()															// limpia visuals, teclado, colisiones y acciones
		game.addVisual(new Fondo(image="fondoCompleto.png"))					// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.schedule(2000,{													// después de un ratito ...
			game.clear()
			game.addVisual(new Fondo(image="ganamos.png"))						// cambio de fondo
			game.schedule(2000,{												// después de un ratito ...
				game.stop()														// fin del juego
			})
		})
	}
	method perderSiCorresponde() {
		if(tony2.energia() == 0) {	
			game.clear()
			game.addVisual(new Fondo(image="fondoBlanco.png"))
			game.schedule(2000,{
				game.clear()
				game.addVisual(new Fondo(image="perdiste.png"))
				game.schedule(2000,{
					game.stop()
				})	
			})			
		}
	}
	method configurarTeclas() {	
		keyboard.up().onPressDo({tony2.moverseArriba()})			
		keyboard.down().onPressDo({tony2.moverseAbajo()})		
		keyboard.right().onPressDo({tony2.moverseDerecha()})		
		keyboard.left().onPressDo({tony2.moverseIzquierda()})
		keyboard.a().onPressDo({tony2.decirEnergia()})		
	}
	method cargarLlaves() {
		(0 .. 2.randomUpTo(3).truncate(0)).forEach{l => game.addVisual(new Llave())}
	}
	method cargarPollos() {
		(0 .. 1.randomUpTo(10).truncate(0)).forEach{p => game.addVisual(new Pollo())}
	}
	method cargarFondo() {
		game.addVisual(new Fondo(image="fondoCompleto.png"))
	}
	method cargarPnj() {
		game.addVisual(tony2)
	}
	method cargarColisiones() {
		game.whenCollideDo(tony2,{l => tony2.guardar(l)})
	}
	method cargarSalida() {
		if(tony2.llaves().size() >= 3 and not game.hasVisual(salidaNvl2)) 
			game.addVisual(salidaNvl2)
	}	
}
