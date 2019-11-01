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
		self.cargarPnj()
		game.onTick(2000,"perderJuego",{=>self.perderSiCorresponde()})		 
		self.cargarColisiones()
		self.configurarTeclas()		
	}
	method ganar() {															
		game.clear()															
		game.addVisual(new Fondo(image="fondoCompleto.png"))					
		game.schedule(2000,{													
			game.clear()
			game.addVisual(new Fondo(image="ganamos.png"))						
			game.schedule(2000,{												
				game.stop()														
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
		game.whenCollideDo(tony2,{s => tony2.ganarElJuego(s)})
		game.whenCollideDo(tony2,{p => tony2.comer(p)})
	}
	method cargarSalida() {
		if(tony2.llaves().size() >= 3 and not game.hasVisual(salidaNvl2)) 
			game.addVisual(salidaNvl2)
	}	
}