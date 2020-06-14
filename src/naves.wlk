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
	
	method estaTranquila() {
		return combustible >= 4000 and velocidad <= 12000 
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
	method misilesDesplegados() {
		return true 
		// cambiar por implementación correcta
	}
	method estaVisible() {
		return true 
		// cambiar por implementación correcta
	}
	
	override method estaTranquila() {
		return super() and not self.misilesDesplegados()
	}
	// el resto se lo dejamos	
}

class NaveHospital inherits NaveDePasajeros {
	var property quirofanosPreparados = false
	override method estaTranquila() {
		return super() and not self.quirofanosPreparados()
	}
}

class NaveDeCombateSigilosa inherits NaveDeCombate {
	override method estaTranquila() {
		return super() and self.estaVisible()
	}
}

class NaveDeCombateSigilosaPlus inherits NaveDeCombateSigilosa {
	method estaPerfecta() {
		return self.estaTranquila() or self.combustible() > 200000
	}
	override method estaVisible() {
		return false
	}
}

