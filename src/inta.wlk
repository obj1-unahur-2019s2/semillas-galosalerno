import semillas.*
import variedades.*

object inta {
	
	var property parcelas = []
	
	method cantidadDePlantas()= parcelas.sum{a=>a.cantidadDePlantas()}
	method cantidadDeParcelas() = parcelas.size()	
	
		method parcelasElegidas() = parcelas.filter{a=>a.cantidadDePlantas()>4}
		method parcelasNoVacias() = self.parcelasElegidas().filter{a=>a.cantidadDePlantasBienAsociadas()>0}
	
		method agregarParcela(parcela){parcelas.add(parcela)}
		method promedioDePlantas()=self.cantidadDePlantas()/self.cantidadDeParcelas()
		method parcelaMasAutosustentable()= self.parcelasNoVacias().max{a=>a.cantidadDePlantasBienAsociadas()}
	
}
