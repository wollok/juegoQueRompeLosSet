import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel_llaves.*

object nivelCajas {	
	
	method configurate() {
		self.cargarFondo() 		// fondo - es importante que sea el primer visual que se agregue			 
		self.cargarCajas() 		// otros visuals, p.ej. bloques o llaves
		self.cargarFinal()
		self.cargarPnj() 		// personaje, es importante que sea el último visual que se agregue
		self.cargarFinal()	
		self.cargarColisiones()
		self.configurarTeclas()
	}
	
	method terminar() {
		game.clear()											// limpia visuals, teclado, colisiones y acciones
		game.addVisual(new Fondo(image="fondoCompleto.png"))	// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(tony1)
		game.schedule(2500, {									// después de un ratito ...
			game.clear()
			game.addVisual(new Fondo(image="finNivel1.png")) 	// cambio de fondo
			game.schedule(3000, {								// después de un ratito ...		
				game.clear()									// ... limpio todo de nuevo
				nivelLlaves.configurate()						// y arranco el siguiente nivel
			})
		})
	}
	
	method configurarTeclas() {	
		keyboard.up().onPressDo({tony1.moverseArriba()})			
		keyboard.down().onPressDo({tony1.moverseAbajo()})		
		keyboard.right().onPressDo({tony1.moverseDerecha()})		
		keyboard.left().onPressDo({tony1.moverseIzquierda()})
		keyboard.n().onPressDo({self.terminar()})
	}
	
	method cargarCajas() {
		(0 .. 5.randomUpTo(6).truncate(0)).forEach{a => game.addVisual(new Caja())}
	}
	
	method cargarFondo() {
		game.addVisual(new Fondo(image="fondoCompleto.png"))
	}
	
	method cargarPnj() {
		game.addVisual(tony1)
	}
	
	method cargarFinal() {
		game.addVisual(salidaNvl1)
	}
	
	method cargarColisiones() {
		game.whenCollideDo(tony1,{c => c.movete()})
	}	
}