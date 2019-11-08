import semillas.*
import inta.*

class SojaTransgenica inherits Soja {
	
override	method daNuevaSemillas() = false	

override	method esIdeal(parcela)=parcela.cantidadMaximaDePlantas()==1

}
class Hiervabuena inherits Menta{

override	method espacioQueOcupa()=super()*2	
}



class Parcelas {
	
	var property ancho = 10
	var property largo = 5
	var property horasDeSol = 100
	var property plantas = []
	
		method puedeAgregar(planta)=horasDeSol-planta.horasDeSol()-2>=0
		
		method superficie()=ancho*largo
		method cantidadMaximaDePlantas()= if(ancho>largo){self.superficie()/5}	else {(self.superficie()/3)+largo}	
		method esComplicada()=plantas.any{a=>a.horasDeSol()<horasDeSol}
		method plantar(planta){
			if(not (self.cantidadMaximaDePlantas()>plantas.size() and self.puedeAgregar(planta))){self.error("no se puede")}
			else{plantas.add(planta)}						
		}
		method cantidadDePlantas(){return plantas.size()}
		method seAsociaBien(planta)
		method cantidadDePlantasBienAsociadas()=plantas.filter{a=>self.seAsociaBien(a)}.size()
}

class ParcelasEcologicas inherits Parcelas{
	
override	method seAsociaBien(planta)= not self.esComplicada() and  planta.esIdeal(self)
}

class ParcelasIndustriales inherits Parcelas{
	
override	method seAsociaBien(planta)= plantas.size()<=2 and planta.esFuerte()
}