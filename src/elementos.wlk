import wollok.game.*
import personajes.*

class Caja {	
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))					
const property image = "caja.png" 		

 	/*method seMueve() {
		if (tony1.position().y() == self.position.y()-1) {  
			self.position() = tony1.position().y() + 1
		} else {
			
		}	
	}*/
}

class Llave {
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))
const property image = "llave.png"
	
	method esAgarrada() {
		
	}								
}

class Pollo {
var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),
								0.randomUpTo(game.height()-1).truncate(0))
const property image = "pollo.png"

	method esConsumido() {
		
	}									
}

object salidaNvl1 {	

var property position = game.at(7,10)	
const property image = "salida.png"
	
}
