import wollok.game.*
import personajes.*
import direcciones.*
import nivel_llaves.*

class Caja {	
var property position = game.at(1.randomUpTo(game.width()-2).truncate(0),
								1.randomUpTo(game.height()-2).truncate(0))					
const property image = "caja.png"
const property deposito 	
 	
 	method seMueve(direccion) {
		self.validarUnaPosicionVacia(direccion) 	
		position = direccion.siguiente(position)
	}
	method validarUnaPosicionVacia(direccion) {
		const posicionAdyacente = direccion.siguiente(position) 
		
		var posicionVacia = game.getObjectsIn(posicionAdyacente).all{o => o.puedePisarte(self)} 
		
		if (!posicionVacia) 
			throw new Exception(message = "Algo esta trabando la caja.") 
	}
	method estaBienPosicionada() = deposito.map{l => l.position()}.contains(self.position()) 	
	method puedePisarte(_) = false
	method esCaja() = true
}

object noCaja {
var property position = tony1.position()	
	
	method esCaja() = false
	method seMueve(direccion) {}
}

object salidaNvl1 {	
var property position = game.at(9,12)	
const property image = "salida.jpg"

	method esCaja() = false
	method seMueve(direccion) {}
}

class Llave {
var property position = game.at(1.randomUpTo(game.width()-1).truncate(0),
								1.randomUpTo(game.height()-1).truncate(0))
const property image = "llave.png"

	method esAgarrada() {
		//if(self.esLlave())
			game.removeVisual(self) 
	}
	method esLlave() = true								
}

class Pollo {
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))
const property image = "pollo.jpg"
var property energiaXPollo = 10.randomUpTo(100).truncate(0)
	
	method esConsumido() = energiaXPollo
	method esAgarrada() {}
	method esLlave() = false 									
}

object noLlave {
var property position = tony2.position()

	method esAgarrada() {}
	method esLlave() = false	
}

object salidaNvl2 {
var property position = game.at(9,12)
const property image = "salida.jpg"
	
	method terminarJuego() {nivelLlaves.ganar()}
	method esAgarrada() {}
	method esLlave() = false	
}