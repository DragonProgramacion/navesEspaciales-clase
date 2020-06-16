class NaveEspacial {
	var property velocidad = 0
	var property direccion = 0	
	var property combustible = 0
	
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad = (velocidad - cuanto).max(-10) }
	
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
	
	var property colorBaliza = ""
	
	method cambiarColorDeBaliza(nuevoColor) {colorBaliza = nuevoColor}
	
	override method prepararViaje() {
		super()
		self.cambiarColorDeBaliza("Verde")
		self.ponerseParaleloAlSol()
	}
	
	override method estaTranquila() {
		return super() and self.colorBaliza() != "Rojo"
	}

	method recibirAmenaza() {
		self.escapar()
		self.avisar()
	}
	
	method escapar() {
		self.irHaciaElSol()
	}
	
	method avisar() {
		self.cambiarColorDeBaliza("Rojo")
	}
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
	
	method recibirAmenaza() {
		self.escapar()
		self.avisar()
	}
	
	method escapar() {
		velocidad = velocidad * 2
	}
	
	method avisar() {
		self.descargarComida(pasajeros)
		self.descargarBebida(pasajeros * 2)
	}
}

class NaveDeCombate inherits NaveEspacial {
	var property estaVisible 
	var property misilesDesplegados 
	
	const property mensajesEmitidos = []
	
	method emitirMensaje(mensaje) {
		mensajesEmitidos.add(mensaje)
	}
	
	method primerMensajeEmitido() {
		return mensajesEmitidos.first()
	}
	
	method ultimoMensajeEmitido() {
		return mensajesEmitidos.last()
	}
	
	override method prepararViaje() {
		super()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en misión")
	}
	
	method emitioMensaje(mensajeEmitido) {
		mensajesEmitidos.any({mensajes => mensajes == mensajeEmitido})
	}
	
	method esEscueta() {
		return mensajesEmitidos.all({mensajes => mensajes.length() < 30})
	}
	
	method desplegarMisiles() {
		misilesDesplegados = true
	}
	
	method replegarMisiles() {
		misilesDesplegados = false
	}
	method ponerseVisible() {
		estaVisible = true
	}
	
	method ponerseInvisible() {
		estaVisible = false
	}
	
	method estaInvisible() {
		return not estaVisible
	}
	
	
	override method estaTranquila() {
		return super() and not self.misilesDesplegados()
	}
	// el resto se lo dejamos	
	
	method recibirAmenaza() {
		self.escapar()
		self.avisar()
	}
	
	method escapar() {
		self.acercarseUnPocoAlSol()
		self.acercarseUnPocoAlSol()
	}
	
	method avisar() {
		self.emitirMensaje("Amenaza Recibida")
	} 
}

class NaveHospital inherits NaveDePasajeros {
	var property quirofanosPreparados = false
	
	override method estaTranquila() {
		return super() and not self.quirofanosPreparados()
	}
	
	method prepararQuirofanos() {
		quirofanosPreparados = true 
	}
	
	override method recibirAmenaza() {
		super()
		self.prepararQuirofanos()
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
	
	override method recibirAmenaza() {
		super()
		self.desplegarMisiles()
		self.ponerseInvisible()
	}
}

