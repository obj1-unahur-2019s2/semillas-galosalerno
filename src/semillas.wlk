import inta.*
import variedades.*

class Semillas {

	var property fechaDeObtencion
	var property altura

	method horasDeSol()

	method espacioQueOcupa()

	method esFuerte() = self.horasDeSol() > 10

	method daNuevaSemillas() = self.esFuerte()
	
	method esIdeal(parcela)

}

class Menta inherits Semillas {

	override method horasDeSol() = 6

	override method daNuevaSemillas() = super() or altura > 0.4

	override method espacioQueOcupa() = altura * 3

	override method esIdeal(parcela)=parcela.superficie()>6
}

class Soja inherits Semillas {

	override method horasDeSol() = if (altura < 0.5) {
		6
	} else if (altura > 0.5 and altura < 1) {
		7
	} else {
		9
	}

	override method daNuevaSemillas() = super() or (fechaDeObtencion > 2007 and altura > 1)

	override method espacioQueOcupa() = altura / 2
	
	override method esIdeal(parcela)=parcela.horasDeSol()==self.horasDeSol()
}

class Quinoa inherits Semillas {

	var property horasDeSol

override 	method espacioQueOcupa()=0.5	

override	method daNuevaSemillas() = super() or fechaDeObtencion < 2005

override	method esIdeal(parcela)=parcela.plantas().filter{a=>a.altura()>1.5}		.size()	==	0	
								   		//plantas con mas de 1.5mts de altura	  cant de plantas
}

