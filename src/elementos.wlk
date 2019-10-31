import wollok.game.*
import personajes.*
import direcciones.*

class Caja {	
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))					
const property image = "caja.png"
const property deposito 
/* 
const property esBordeArriba = self.position().y() == game.height()-1
const property esBordeAbajo = self.position().y() == 0
const property esBordeIzquierdo = self.position().x() == 0
const property esBordeDerecho = self.position().x() == game.width()-1
*/ 		
 	
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
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))
const property image = "llave.png"

	method esAgarrada(llave) {
		if(self.esLlave())
			game.removeVisual(llave) 
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
var property position = game.at(8,10)
const property image = "salida.jpg"
	
	method esAgarrada() {}
	method esLlave() = false	
}
/* 
class Salida {
var property position
const property image = "salida.jpg"
	
	method seMueve(direccion) {}
	method puedePisarte(_) = true
}
*/
