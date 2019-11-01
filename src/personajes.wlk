import wollok.game.*
import elementos.*
import direcciones.*

object tony1 {
var property position = game.at(7, 9)
const property image = "player.png"
const property cajasEnDepo = #{}
var direccion = arriba
//var ubicacion  

	method empujar(elemento) {
		try {
			elemento.seMueve(direccion)
			self.cajasEnElDeposito(elemento)
		} catch e {
			console.println(e)
			self.retroceder()
		}
	}	
	method retroceder() {
		position = direccion.opuesto().siguiente(position)	
	}
	method retrocederCon(c) {
		self.retroceder()
		c.movete(direccion.opuesto())
	}
	method moverseArriba() { 
		direccion = arriba
		if (self.position().y() != game.height()-1) 
			self.moverse()
	}
	method moverseAbajo() {
		direccion = abajo
		if (self.position().y() != 0) 
			self.moverse()
	}
	method moverseIzquierda() {
		direccion = izquierda
		if (self.position().x() != 0) 
			self.moverse()
	}
	method moverseDerecha() {
		direccion = derecha
		if (self.position().x() != game.width()-1) 
			self.moverse()
	}
	method moverse() {
		position = direccion.siguiente(position)
	}
	method cajasEnElDeposito(caja) {
		if (caja.position().x().between(5,9) and caja.position().y().between(7,12)) { 
			cajasEnDepo.add(caja)
		} else {
			cajasEnDepo.remove(caja)	// Esto contempla el caso en el que una caja que no tiene Position se agrega a cajasEnDepo
		}		
	}
	method cargarLaSalida() {
		if (cajasEnDepo.size() >= 5)	// Esto también contempla el mismo caso, ya que en teoria hay 5 cajas en tablero, pero a veces al moverlas se añade una caja sin Position		 
			game.addVisual(salidaNvl1)	
	}
}										//ubicacion != null and
/*
var property position = game.at(7,9)
const property image = "player.png"
var caja = noCaja
var ubicacion = self.position()
const property cajasEnDepo = #{}

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
	}
}
*/

object tony2 {
var property position = game.at(7,9)
const property image = "player.png"
const property llaves = #{}	
var direccion = arriba
var llave 
var energia = 4
var pasos = 0

 	method contarPasos() {
		pasos++
		if (pasos % 10 == 0) {energia = 0.max(energia-1)}	
	}
	method guardar(elemento) {
		llave = elemento
		try {
			elemento.esAgarrada()
		} then always {
			llaves.add(llave)
		}
	}
	method comerPollo() {
		energia += game.whenCollideDo(self,{p => p.esConsumido()})
	}
	method energia() = energia
 	method moverseArriba() { 
		direccion = arriba
		if (self.position().y() != game.height()-1) 
			self.moverse()
			self.contarPasos()
	}
	method moverseAbajo() {
		direccion = abajo
		if (self.position().y() != 0) 
			self.moverse()
			self.contarPasos()
	}
	method moverseIzquierda() {
		direccion = izquierda
		if (self.position().x() != 0) 
			self.moverse()
			self.contarPasos()
	}
	method moverseDerecha() {
		direccion = derecha
		if (self.position().x() != game.width()-1) 
			self.moverse()
			self.contarPasos()
	}
	method moverse() {
		position = direccion.siguiente(position)
	}
	method decirEnergia() {
		game.say(self,"Energía:"+energia)
	}
	method esLlave() = false
}