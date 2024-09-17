import cosas.* 

// Si no hay ordenes no se usa forEach !!!

object casaDePepeYJulian {
	const property cosas = [] // La transforme en property para los test

method comprar(cosa) {
	cosas.add(cosa)
}

method cantidadDeCosasCompradas() {
	return cosas.size()
}

method tieneAlgun(categoria) {
	return cosas.any({cosa => cosa.categoria() == categoria})
}

method vieneDeComprar(categoria) {
	return not cosas.isEmpty() and self.ultimoComprado().categoria() == categoria	
}

method ultimoComprado() {
	return cosas.last()
}

method esDerrochona() {
	return self.costoDeCosas() >= 9000
}

method costoDeCosas() {
	return cosas.sum({cosa =>cosa.precio()})
}

method compraMasCara() {
	return cosas.max({cosa => cosa.precio()})
}

method comprados(categoria) {
	return cosas.filter({cosa =>cosa.categoria()==categoria})
}

method malaEpoca() {
	return cosas.all({cosa => cosa.categoria()==comida}) // Para evitar usar comida, podemos asignar un method esComestible a cada categoria y consultar por ese booleano.
}

method queFaltaComprar(lista) {
	return lista.filter({cosa => not cosas.contains(cosa)})
}

method faltaComida() {
	return self.comprados(comida).size() < 2
	// Resolucion profe: cosas.count({cosa => cosa.categoria().esComestible()}) < 2 (count te devuelve la cantidad que cumplen la condicion)
	// Otra : cosas.filter({cosa => cosa.categoria().esComestible()}).size() < 2
	// COUNT es lo mismo que filter + size
}

method categoriasCompradas() {
	return cosas.map({cosa => cosa.categoria()}).asSet()
}
}


