import wollok.game.*
import elementos.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object tony1 {
var property position = game.at(7,9)
const property image = "player.png"
var caja = noCaja
const property cajas = #{}	

 	method moverseArriba() {
		if (self.position().y() != game.height()-1) {	
			self.position(self.position().up(1))
			if(caja.esCaja()) {
				caja.position(self.position())
			}
		} 
	}
	method moverseAbajo() {
		if (self.position().y() != 0) {
			self.position(self.position().down(1))
			if(caja.esCaja()) {
				caja.position(self.position())
			}
		}
	}
	method moverseDerecha() {
		if (self.position().x() != game.width()-1) {
			self.position(self.position().right(1))
			if(caja.esCaja()) {
				caja.position(self.position())
			}
		}
	}
	method moverseIzquierda() {
		if (self.position().x() != 0) {
			self.position(self.position().left(1))
			if(caja.esCaja()) {
				caja.position(self.position())
			}
		}
	}
	method agarrar() {
		if (caja.esCaja()) {
			self.error("Ya tengo una caja.")
		} 
		const cajaColliders = game.colliders(self).filter{c => c.esCaja()}
		if (not cajaColliders.isEmpty()) {
			caja=cajaColliders.first()
			cajas.add(cajaColliders.first())
		}					
	}
	method soltar() {
		if (caja.esCaja()) {
			caja=noCaja
		} else {
			self.error("No tengo nada para soltar")
		}
	}
	method salirDelNivel() {
		if (cajas.size() >= 5.max(6)) {
			game.addVisual(salidaNvl1)
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
	method comerPollo() {
		energia += game.whenCollideDo(self, {p => p.esConsumido()})
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