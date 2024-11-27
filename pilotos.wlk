import naves.*

class Piloto {
	var property peso
	const navesPilotadas = []
	
	method leAgrada(unaNave)
	method pilotar(unaNave) {
		if(!self.leAgrada(unaNave)) self.error("al piloto no le agrada la nave")
		navesPilotadas.add(unaNave)
	}
	method sumaPesosNaves() = navesPilotadas.sum({n => n.peso()})
	method estaSatisfecho() = self.sumaPesosNaves() * 10 >= self.peso() and self.condicionAdicional()
	method condicionAdicional() = true
}

class PilotoSecundario inherits Piloto {
	override method leAgrada(unaNave) {
		return unaNave.compatiblePilotoSecundario() and unaNave.valoracion() > 85 
	} 
	override method condicionAdicional() = not navesPilotadas.any({n => n.esPoderosa()})
}

class PilotoDeAtaque inherits Piloto {
	override method leAgrada(unaNave) = unaNave.esPoderosa()
}

class PilotoTactico inherits Piloto {
	override method leAgrada(unaNave) {
		return unaNave.peso().between(6,12) or unaNave.valoracion() > 100 
	} 
	override method condicionAdicional() = navesPilotadas.size().even()
}