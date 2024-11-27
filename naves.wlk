class Nave {
	var property calidad
	
	method compatiblePilotoSecundario() = false
	method valoracion()
	method esPoderosa() = self.peso() >= 5
	method peso()
	
}

class Cyclone inherits Nave {
	var peso
	var estaEnModoVehiculo = true
	
	override method peso() = peso
	method cambiarAModoVehiculo() { estaEnModoVehiculo = true }
	method cambiarAModoBatalla() { estaEnModoVehiculo = false }
	method estaEnModoVehiculo() = estaEnModoVehiculo
	method estaEnModoBatalla() = !estaEnModoVehiculo
	override method compatiblePilotoSecundario() = estaEnModoVehiculo
	method esEspecial() = self.esPoderosa() or self.estaEnModoBatalla()
	override method valoracion() = if(self.esEspecial()) 120 else 80
}

class Veritech inherits Nave {
	var arma
	override method peso() = 5
	override method valoracion() = 60 + arma.valoracion() 
	override method esPoderosa() = self.peso() >= 5
}

class Alpha inherits Veritech {
	var modelo
	override method peso() = super() * 2
	override method compatiblePilotoSecundario() = true
	method cantLetrasModelo() = modelo.size()
	method plusValoracion() = 17.min(2*self.cantLetrasModelo())
	override method valoracion() = super() + self.plusValoracion()
}

object rifle {
	method valoracion() = 0
}

object canionParticulas {
	method valoracion() = 20
}

object misiles {
	method valoracion() = 45
}
