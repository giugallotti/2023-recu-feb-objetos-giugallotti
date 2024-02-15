import terrenos.*

class Cultivos{
	var property valorNutricional
	var property precioVenta
	
	method puedePlantarse(terreno) {
		return true
	}	
}

class Papa inherits Cultivos {
	
	method cultivoEnTerrenoRico() {
		valorNutricional = 1500 * 2
	}
	
	override method precioVenta() {
		precioVenta = valorNutricional / 2
		return precioVenta
	}
}

class Algodon inherits Cultivos {
	
	override method precioVenta() {
		precioVenta = 500
		return precioVenta
	}
	
	override method puedePlantarse(terreno) {
		return terreno.esRico()
	}
}

class ArbolFrutal inherits Cultivos {
	var edad
	
	override method valorNutricional() {
		valorNutricional = (edad * 3) < 4000
	}	
	
	override method puedePlantarse(terreno) {
		return terreno.esCampoAbierto()
	}
}

class PalmeraTropical inherits ArbolFrutal {
	
	override method precioVenta() {
		return precioVenta * 5
	}
	
	override method valorNutricional() {
		valorNutricional = (edad * 2) < 7500
	}
	
	override method puedePlantarse(terreno) {
		return terreno.esRico()
	}
}



