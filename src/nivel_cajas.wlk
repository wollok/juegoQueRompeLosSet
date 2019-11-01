import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel_llaves.*

object nivelCajas {		
	method configurate() {
		self.cargarFondo() 																	 
		self.cargarCajas()
		self.cargarPnj()
		self.cargarColisiones() 																														
		self.configurarTeclas()
	}
	method terminarSiCorresponde() {
		//if(tony1.cajasEnDepo().size() >= 5) {
			game.clear()																
			game.addVisual(new Fondo(image="fondoCompleto.png"))						
			game.addVisual(tony1)
			game.schedule(2000,{														
				game.clear()
				game.addVisual(new Fondo(image="finNivel1.png")) 						
				game.schedule(2000,{														
					game.clear()														
					nivelLlaves.configurate()											
				})
			})			
		//}
	}
	method configurarTeclas() {	
		keyboard.up().onPressDo{tony1.moverseArriba()}
		keyboard.down().onPressDo{tony1.moverseAbajo()}
		keyboard.left().onPressDo{tony1.moverseIzquierda()}
		keyboard.right().onPressDo{tony1.moverseDerecha()}
		keyboard.q().onPressDo{tony1.cargarLaSalida()}
		keyboard.n().onPressDo{self.terminarSiCorresponde()}
	}
	method cargarCajas() {
		(0 .. 4.randomUpTo(5).truncate(0)).forEach{c => game.addVisual(new Caja())}
	}
	method cargarFondo() {
		game.addVisual(new Fondo(image="fondoCompleto.png"))
	}
	method cargarPnj() {
		game.addVisual(tony1)
	}
	method cargarColisiones() {
		game.whenCollideDo(tony1,{c => tony1.empujar(c)})
	}
}