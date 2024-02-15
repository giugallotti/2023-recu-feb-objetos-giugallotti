import cultivos.*

class Terreno {
    const cultivos = []
    var property capacidadMaxima
    var property costoMantenimiento    
    
    method puedePlantar(cultivo) {
    	return true
    }
    
    method mediaNutricional() {
    	return (cultivos.map{c => c.valorNutricional()}.sum()) / cultivos.size()
    }
    
    method valorNeto() {
    	return cultivos.map{c => c.valorCosecha()}.sum() - costoMantenimiento
    }
 
 	method plantarUnCultivo(cultivo) {
 		return (cultivos.size() < capacidadMaxima) && self.puedePlantar(cultivo)
 	}
    
}

class CampoAbierto inherits Terreno {
    var riquezaSuelo
    
    override method capacidadMaxima() = 4
    
    method esRico() {
        return riquezaSuelo > 100
    }
    
    override method costoMantenimiento() {
       return 500 * cultivos.size()
    }
    
    method esCampoAbierto() {
    	return true
    }
}

class Invernadero inherits Terreno {
    var dispositivoElectronico
    var capacidadActual
    
    method esRico() {
    	return cultivos.filter{c => c.esRico()}.size() < capacidadActual
    	|| dispositivoElectronico.rico()
    }
    
    override method costoMantenimiento() {
      return dispositivoElectronico.costo()
      }
 }
 
class DispositivoElectronico inherits Invernadero {
    method costo() {
    	return 50000
    }
    
	method rico() {
		return true
	}
}

class ReguladorNutricional inherits DispositivoElectronico {
    override method costo() {
        return super() + 2000
    }
    
    override method rico() {
    	return true
    }
}

class Humidificador inherits DispositivoElectronico {
    var humedad
    
    override method costo() {
    	if (humedad <= 30)
    		return super() + 1000
    	else
    		return super() + 4500		
    }
    
    override method rico() {
    	return humedad > 20 && humedad < 40
    }
}

class PanelesSolares inherits DispositivoElectronico {
    override method costo() {
        return super() - 25000
    }
}
