import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel_llaves.*

object nivelCajas {		
	method configurate() {
		self.cargarFondo() 															// fondo - es importante que sea el primer visual que se agregue			 
		self.cargarCajas() 															// otros visuals, p.ej. bloques o llaves
		game.onTick(2000,"revisarSalida",{=>self.contarCajas()})
		self.cargarPnj() 															// personaje, es importante que sea el último visual que se agregue	
		self.cargarColisiones()
		self.configurarTeclas()
	}
	method terminar() {
		game.clear()																// limpia visuals, teclado, colisiones y acciones
		game.addVisual(new Fondo(image="fondoCompleto.png"))						// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(tony1)
		game.schedule(2000,{														// después de un ratito ...
			game.clear()
			game.addVisual(new Fondo(image="finNivel1.png")) 						// cambio de fondo
			game.schedule(2000,{													// después de un ratito ...		
				game.clear()														// ... limpio todo de nuevo
				nivelLlaves.configurate()											// y arranco el siguiente nivel
			})
		})
	}
	method configurarTeclas() {	
		keyboard.up().onPressDo{tony1.moverseArriba()}
		keyboard.down().onPressDo{tony1.moverseAbajo()}
		keyboard.left().onPressDo{tony1.moverseIzquierda()}
		keyboard.right().onPressDo{tony1.moverseDerecha()}
		keyboard.q().onPressDo{tony1.cargarLaSalida()}
		keyboard.n().onPressDo{self.terminar()}
	}
	method cargarCajas() {
		(0 .. 4.randomUpTo(5).truncate(0)).forEach{c => game.addVisual(new Caja())}
	}
	method cargarFondo() {
		game.addVisual(new Fondo(image="fondoCompleto.png"))
	}
	method cargarPnj() {
		game.addVisual(tony1)
	}
	method contarCajas() {
		tony1.cajasEnElDeposito()
	}
	/*method cargarFinal() {
		if (tony1.cajasEnDepo().size() == 5 and game.hasVisual(salidaNvl1)) 
			keyboard.n().onPressDo{self.terminar()}
	}*/
	method cargarColisiones() {
		game.whenCollideDo(tony1,{c => tony1.empujar(c)})
	}
	/*method comprobarSiGano() {
		if (cajas.all{ c => c.estaBienPosicionada() }) {
			game.addVisual(salidaNvl1) 
		}
	}*/	
}