import wollok.game.*
import personajes.*

class Caja {	
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))					
const property image = "caja.png"
 		

 	/*method seMueve() {
		if (tony1.position().y() == self.position().y()-1) {  			
			self.position( game.at(tony1.position().x(), tony1.position().y() + 1))  
		}	
	}*/
	method esCaja() = true
}

object noCaja {
var property position	
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
const property image = "pollo.png"
var property energiaXPollo = 1.randomUpTo(100).truncate(0)
	
	method esConsumido() = energiaXPollo									
}

object salidaNvl1 {	

var property position = game.at(9,12)	
const property image = "salida.png"

}
