!classDefinition: #CarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCurandera class
	instanceVariableNames: 'frasesParaPersonajesSegunOpinionDelPueblo cantidadDeInteracciones cantidadDeInteraccionesConPersonajes'!

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'CapraFranco 10/2/2021 23:31:39'!
interactuarCon: unPersonaje
	self recordarInteraccionCon: unPersonaje.
	^ self responderSegunCantidadDeInteraccionesCon: unPersonaje.! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'CapraFranco 10/3/2021 00:10:59'!
olvidarInteraccionesCon: unPersonaje
	cantidadDeInteraccionesConPersonajes at: unPersonaje put: 0.! !


!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'CapraFranco 10/2/2021 23:31:39'!
obtenerFrasesPara: unPersonaje
	|opinionDelPueblo |
	
	opinionDelPueblo := Pueblo dameTuOpinionDe: unPersonaje.
	
	^frasesParaPersonajesSegunOpinionDelPueblo at: opinionDelPueblo .! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'CapraFranco 10/2/2021 23:31:39'!
olvidarInteracciones
	cantidadDeInteraccionesConPersonajes := Dictionary new
! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'CapraFranco 10/2/2021 23:31:39'!
recordarInteraccionCon: unPersonaje
	| interacciones |
	interacciones := cantidadDeInteraccionesConPersonajes at: unPersonaje ifAbsent: [0].
	cantidadDeInteraccionesConPersonajes at: unPersonaje put: interacciones + 1.
! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'CapraFranco 10/3/2021 00:12:25'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	| cantidadDeInteraccionesDelPersonaje frases|
	
	cantidadDeInteraccionesDelPersonaje := cantidadDeInteraccionesConPersonajes at: unPersonaje.
	
	frases := self obtenerFrasesPara: unPersonaje.
	
	(Pueblo loVesPrometedorA: unPersonaje) ifFalse: [
		cantidadDeInteraccionesDelPersonaje >=  frases size ifTrue:[ 
			Pueblo hacerPrometedorA: unPersonaje.
			self olvidarInteraccionesCon: unPersonaje.
			TreborElGuardiaDeSkyrim olvidarInteraccionesCon: unPersonaje.
		]
	].
	
	^ frases at: (cantidadDeInteraccionesDelPersonaje min: frases size)! !


!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/3/2021 00:30:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPersonajesSegunOpinionDelPueblo := ((Dictionary new) add: ('Forastero'->#('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' )); add: ('Prometedor'->#('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' )); yourself).
	cantidadDeInteracciones := 0.
	cantidadDeInteraccionesConPersonajes := ((Dictionary new) add: (#Hamilton->0); yourself).! !


!classDefinition: #Hamilton category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Hamilton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'CapraFranco 10/3/2021 00:29:01'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/30/2021 19:09:06'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Salud aventurero!!'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/30/2021 19:08:45'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Bienvenido aventurero!!'. ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'CapraFranco 10/2/2021 23:49:11'!
carolinaLaCurandera
	^ CarolinaLaCurandera .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'CapraFranco 10/2/2021 23:50:12'!
hamilton
	^#Hamilton .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'CapraFranco 10/2/2021 23:39:02'!
riverwood
	^Pueblo! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'CapraFranco 10/2/2021 23:50:04'!
tirion
	^#Tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'CapraFranco 10/3/2021 00:28:12'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^self riverwood loVesPrometedorA:   unPersonaje.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'CapraFranco 10/2/2021 23:37:40'!
hacerQueLaCuranderaOlvideSusInteracciones
	self carolinaLaCurandera olvidarInteracciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'CapraFranco 10/2/2021 23:41:50'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	self riverwood olvidarOpiniones .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'CapraFranco 10/2/2021 23:42:22'!
hacerQueRiverwoodVeaPrometedorAHamilton
	self riverwood hacerPrometedorA: self hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'CapraFranco 10/2/2021 22:53:40'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidarInteracciones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'CapraFranco 10/2/2021 22:49:08'!
hamilton
	^#Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'CapraFranco 10/2/2021 23:39:34'!
riverwood
	^Pueblo! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'CapraFranco 10/2/2021 22:49:22'!
tirion
	^#Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'CapraFranco 10/2/2021 22:51:22'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidarInteracciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'CapraFranco 10/2/2021 23:40:49'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	self riverwood olvidarOpiniones .! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'CapraFranco 10/2/2021 23:39:53'!
hacerQueRiverwoodVeaPrometedorAHamilton
	self riverwood hacerPrometedorA: self hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #Pueblo category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Pueblo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pueblo class' category: 'Ejercicio1-PNJ-Episodio2'!
Pueblo class
	instanceVariableNames: 'opinionesDeLosAventureros'!

!Pueblo class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/2/2021 23:19:28'!
dameTuOpinionDe: unPersonaje
	^ opinionesDeLosAventureros at: unPersonaje ifAbsent: ['Forastero'].! !

!Pueblo class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/2/2021 23:22:12'!
hacerPrometedorA: unPersonaje
	opinionesDeLosAventureros at: unPersonaje put: 'Prometedor'.! !

!Pueblo class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/3/2021 00:30:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	opinionesDeLosAventureros := ((Dictionary new) add: (#Hamilton->'Prometedor'); yourself).! !

!Pueblo class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/3/2021 00:28:43'!
loVesPrometedorA: unPersonaje
	^(self dameTuOpinionDe: unPersonaje) isEqualTo: 'Prometedor'.
	! !

!Pueblo class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/2/2021 23:23:00'!
olvidarOpiniones
	opinionesDeLosAventureros  := Dictionary new.! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesParaPersonajesSegunOpinionDelPueblo cantidadDeInteracciones cantidadDeInteraccionesConPersonajes'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'CapraFranco 10/2/2021 22:38:15'!
interactuarCon: unPersonaje
	self recordarInteraccionCon: unPersonaje.
	^ self responderSegunCantidadDeInteraccionesCon: unPersonaje.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'CapraFranco 10/3/2021 00:11:32'!
olvidarInteraccionesCon: unPersonaje
	cantidadDeInteraccionesConPersonajes at: unPersonaje put: 0.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'CapraFranco 10/2/2021 23:13:26'!
obtenerFrasesPara: unPersonaje
	|opinionDelPueblo |
	
	opinionDelPueblo := Pueblo dameTuOpinionDe: unPersonaje.
	
	^frasesParaPersonajesSegunOpinionDelPueblo at: opinionDelPueblo .! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'CapraFranco 10/2/2021 22:49:56'!
olvidarInteracciones
	cantidadDeInteraccionesConPersonajes := Dictionary new
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'CapraFranco 10/2/2021 22:45:55'!
recordarInteraccionCon: unPersonaje
	| interacciones |
	interacciones := cantidadDeInteraccionesConPersonajes at: unPersonaje ifAbsent: [0].
	cantidadDeInteraccionesConPersonajes at: unPersonaje put: interacciones + 1.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'CapraFranco 10/2/2021 23:10:24'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	| cantidadDeInteraccionesDelPersonaje frases|
	cantidadDeInteraccionesDelPersonaje := cantidadDeInteraccionesConPersonajes at: unPersonaje.
	
	frases := self obtenerFrasesPara: unPersonaje.
	
	^ frases at: (cantidadDeInteraccionesDelPersonaje min: frases size)! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/3/2021 00:30:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPersonajesSegunOpinionDelPueblo := ((Dictionary new) add: ('Forastero'->#('Hola forastero' '¿Todo bien?' '¿Algún problema?' )); add: ('Prometedor'->#('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' )); yourself).
	cantidadDeInteracciones := 0.
	cantidadDeInteraccionesConPersonajes := ((Dictionary new) add: (#Hamilton->2); yourself).! !

CarolinaLaCurandera initializeAfterFileIn!
Pueblo initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!