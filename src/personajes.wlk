import wollok.game.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object tony1 {
var property position = game.at(7,9)
const property image = "player.png"	

 	method moverseArriba() {
		if (self.position().y() != game.height()-1) {	
			self.position(self.position().up(1))
		} 
	}
	method moverseAbajo() {
		if (self.position().y() != 0) {
			self.position(self.position().down(1))
		}
	}
	method moverseDerecha() {
		if (self.position().x() != game.width()-1) {
			self.position(self.position().right(1))
		}
	}
	method moverseIzquierda() {
		if (self.position().x() != 0) {
			self.position(self.position().left(1))
		}
	}
}

object tony2 {
var property position = game.at(7,9)
const property image = "player.png"	
var energia = 40
var pasos = 0

 	method contarPasos() {
		pasos++
		if (pasos % 10 == 0) 0.max(energia--)	
	}
 	method moverseArriba() {
		if (self.position().y() != game.height()-1) {	
			self.position(self.position().up(1))
			self.contarPasos()
		} 
	}
	method moverseAbajo() {
		if (self.position().y() != 0) {
			self.position(self.position().down(1))
			self.contarPasos()
		}
	}
	method moverseDerecha() {
		if (self.position().x() != game.width()-1) {
			self.position(self.position().right(1))
			self.contarPasos()
		}
	}
	method moverseIzquierda() {
		if (self.position().x() != 0) {
			self.position(self.position().left(1))
			self.contarPasos()
		}
	}
}	