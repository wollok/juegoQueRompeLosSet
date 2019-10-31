import wollok.game.*
import personajes.*
import direcciones.*

class Caja {	
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))					
const property image = "caja.png"
const property llegadas

const property esBordeArriba = self.position().y() == game.height()-1
const property esBordeAbajo = self.position().y() == 0
const property esBordeIzquierdo = self.position().x() == 0
const property esBordeDerecho = self.position().x() == game.width()-1
 		
 	method movete(direccion) {
		self.validarLugarLibre(direccion) 
		position = direccion.siguiente(position)
	}
	method validarLugarLibre(direccion) {
		const posAlLado = direccion.siguiente(position) 
		var lugarLibre = game.getObjectsIn(posAlLado)
			.all{ obj => obj.puedePisarte(self) } 
		if (!lugarLibre) 
			throw new Exception(message = "Algo traba la caja.") 
	}
	method puedePisarte(_) = false
	method estaBienPosicionada() {
		return llegadas
			.map{ llegada => llegada.position() }
			.contains(self.position()) 
	}	
 	/*method seMueve() {
		if (tony1.position().y() == self.position().y()-1) {  			
			self.position( game.at(tony1.position().x(), tony1.position().y() + 1))  
		}	
	}*/
	method esCaja() = true
}

object noCaja {
var property position = tony1.position()	
	
	method esCaja() = false
}

class Llave {
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))
const property image = "llave.png"

	method esAgarrada() {
		
	}
	method esCaja() = false								
}

class Pollo {
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))
const property image = "pollo.jpg"
var property energiaXPollo = 1.randomUpTo(100).truncate(0)
	
	method esConsumido() = energiaXPollo									
}

class Salida {
var property position
const property image = "salida.jpg"
	
	method movete(direccion) {}
	method puedePisarte(_) = true
}

object salidaNvl1 {	

var property position = game.at(9,12)	
const property image = "salida.jpg"

	method esCaja() = false
}
