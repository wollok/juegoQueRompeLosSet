import wollok.game.*
import elementos.*
import direcciones.*

object tony1 {
var property position = game.at(7, 9)
const property image = "player.png"
var direccion = arriba

	method empujar(elemento) {
			try
				elemento.movete(direccion)
			catch e {
				console.println(e)
				self.retrocede()
			}
	}	
	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}
	method retrocedeCon(caja) {
		self.retrocede()
		caja.movete(direccion.opuesto())
	}
	method irArriba() { 
		direccion = arriba
		if (self.position().y() != game.height()-1) 
			self.avanzar()
	}
	method irAbajo() {
		direccion = abajo
		if (self.position().y() != 0) 
			self.avanzar()
	}
	method irIzquierda() {
		direccion = izquierda
		if (self.position().x() != 0) 
			self.avanzar()
	}
	method irDerecha() {
		direccion = derecha
		if (self.position().x() != game.width()-1) 
			self.avanzar()
	}
	method avanzar() {
		position = direccion.siguiente(position)
	}
/*var property position = game.at(7,9)
const property image = "player.png"
var caja = noCaja
var ubicacion = self.position()
const property cajasEnDepo = #{}*/

 	/*method moverseArriba() {
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
			ubicacion=caja.position()
		}					
	}
	method soltar() {
		if (caja.esCaja()) {
			ubicacion=caja.position()
			caja=noCaja
		} else {
			self.error("No tengo nada para soltar")
		}
	}
	method cajasEnElDeposito() {
			if (ubicacion.x().between(5,9) and ubicacion.y().between(7,12)) {
				cajasEnDepo.add(caja)
			}			
	}
	method salirDelNivel() {
		if (cajasEnDepo.size() >= 5) {
			game.addVisual(salidaNvl1)
		}		
	}*/
}

object tony2 {
var property position = game.at(7,9)
const property image = "player.png"	
var energia = 40
var pasos = 0

 	method contarPasos() {
		pasos++
		if (pasos % 10 == 0) {energia = 0.max(energia--)}	
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
	method decirEnergia() {
		game.say(self,"Energia:"+energia)
	}
}
