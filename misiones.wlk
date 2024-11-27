import naves.*

class Mision {
	const naves = []
	var property nombre
	
	method asignarNave(unaNave) { naves.add(unaNave) }
	method peso() = naves.sum({n => n.peso() })
	method maxCalidadNaves() = naves.max({ n => n.calidad() }).calidad()
	method valoracion() = 0.max( 15 *  self.maxCalidadNaves() - naves.size() )
	 
}