import naves.*
import pilotos.*

object comando {
	const property naves = []
	const pilotos = #{}
	
	method agregarNave(unaNave) {naves.add(unaNave)}
	method cantNavesCompatPilotoSec() = naves.count({n=>n.compatiblePilotoSecundario()})
	method cantNavesNoCompatPilotoSec() = naves.size() - self.cantNavesCompatPilotoSec()
	method tieneBuenaOfertaPilotosSecundarios() { return 
		self.cantNavesCompatPilotoSec() - self.cantNavesNoCompatPilotoSec() >= 2 
	}
	method navesNoCompatPilotoSec() = naves.filter({n => !n.compatiblePilotoSecundario()})
	
	method poderosasNavesNoCompatPilotoSec() {
		return self.navesNoCompatPilotoSec().filter({n => n.esPoderosa()})		
	}
	method laMasPoderosaParaPilotoSec() {
		return self.poderosasNavesNoCompatPilotoSec().max({n => n.valoracion()})
	}
	
	method navesQueLeGustanA(unPiloto) {
		return naves.filter({n => unPiloto.leAgrada(n)})
	}
	
	method elegirNavePara(unPiloto) {
		if(self.navesQueLeGustanA(unPiloto).isEmpty()) self.error("Al piloto no le gusta ninguna nave")
		const unaNave = self.navesQueLeGustanA(unPiloto).anyOne()
		unPiloto.pilotar(unaNave)
		pilotos.add(unPiloto)
		naves.remove(unaNave)
	}
}
