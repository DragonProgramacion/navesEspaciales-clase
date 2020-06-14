class NaveEspacial {
	var property velocidad = 0
	var property direccion = 0	
	var property combustible = 0
	
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad -= cuanto }
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion = direccion + 1 }
	method alejarseUnPocoDelSol() { direccion = direccion - 1 }
	
	method cargarCombustible(cuanto) { combustible += cuanto }
	method descargarCombustible(cuanto) { combustible -= cuanto }

	method prepararViaje() {
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
}

class NaveBaliza inherits NaveEspacial {
	override method prepararViaje() {
		super()
		// completar
	}
	// esta se las dejamos
}

class NaveDePasajeros inherits NaveEspacial {
	var property pasajeros = 0
	var property racionesDeComida = 0
	var property racionesDeBebida = 0
	
	method cargarComida(cuantasRaciones) {
//		racionesDeComida = racionesDeComida + cuantasRaciones 
		racionesDeComida += cuantasRaciones 
	}
	method descargarComida(cuantasRaciones) {
		racionesDeComida = (racionesDeComida - cuantasRaciones).max(0)
	}
	method cargarBebida(cuantasRaciones) {
		racionesDeBebida += cuantasRaciones 
	}
	method descargarBebida(cuantasRaciones) {
		racionesDeBebida = (racionesDeBebida - cuantasRaciones).max(0)
	}
	override method prepararViaje() {
		super()
		self.cargarComida(pasajeros * 4)
		self.cargarBebida(pasajeros * 6)
		self.acercarseUnPocoAlSol()
	}
}

class NaveDeCombate inherits NaveEspacial {
	const property mensajesEmitidos = []
	method primerMensajeEmitido() {
		return mensajesEmitidos.first()
	}
	override method prepararViaje() {
		super()
		self.acelerar(15000)
		// completar
	}
	
	// el resto se lo dejamos	
}


