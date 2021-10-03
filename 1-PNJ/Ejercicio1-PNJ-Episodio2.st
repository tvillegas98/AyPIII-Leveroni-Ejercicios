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

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 16:36:37'!
consultarConElPuebloSiConsideranPrometedorA: unPersonaje
	^(PuebloDeRiverwood loVesPrometedorA: unPersonaje)! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 17:52:46'!
influenciarEnElPuebloSobre: unPersonaje
	PuebloDeRiverwood reconocerComoPrometedorA: unPersonaje.
	
	! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 17:19:27'!
interactuarCon: unPersonaje
	self recordarInteraccionCon: unPersonaje.
	^ self responderSegunCantidadDeInteraccionesCon: unPersonaje.! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 00:38:35'!
olvidarInteraccionesCon: unPersonaje
	cantidadDeInteraccionesConPersonajes at: unPersonaje put: 0.! !


!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 17:52:30'!
analizarLaPopularidadDelPersonaje: unPersonaje
	(self consultarConElPuebloSiConsideranPrometedorA: unPersonaje) ifFalse: [
		(self analizarSiCarolinaAlcanzoLaUltimaFraseDelRepertorioCon: unPersonaje) ifTrue:[ 
			self influenciarEnElPuebloSobre: unPersonaje.
		].
	].! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 17:03:24'!
analizarSiCarolinaAlcanzoLaUltimaFraseDelRepertorioCon: unPersonaje
	| cantidadDeInteraccionesDelPersonaje frases |
	cantidadDeInteraccionesDelPersonaje := cantidadDeInteraccionesConPersonajes at: unPersonaje.
	frases := self obtenerFrasesPara: unPersonaje.
	^cantidadDeInteraccionesDelPersonaje >=  frases size! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 16:43:15'!
obtenerFrasesPara: unPersonaje
	|opinionDelPueblo |	
	opinionDelPueblo := PuebloDeRiverwood queOpinasDe: unPersonaje.
	^frasesParaPersonajesSegunOpinionDelPueblo at: opinionDelPueblo .! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 17:23:54'!
olvidarInteraccionesConTodosLosPersonajes
	cantidadDeInteraccionesConPersonajes := Dictionary new
! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 00:39:04'!
recordarInteraccionCon: unPersonaje
	| interacciones |
	interacciones := cantidadDeInteraccionesConPersonajes at: unPersonaje ifAbsent: [0].
	cantidadDeInteraccionesConPersonajes at: unPersonaje put: interacciones + 1.
! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 17:28:39'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	| cantidadDeInteraccionesDelPersonaje frases|	
	cantidadDeInteraccionesDelPersonaje := cantidadDeInteraccionesConPersonajes at: unPersonaje.
	frases := self obtenerFrasesPara: unPersonaje.
	self analizarLaPopularidadDelPersonaje: unPersonaje.
	^ frases at: (cantidadDeInteraccionesDelPersonaje min: frases size)! !


!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'TV 10/3/2021 17:56:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPersonajesSegunOpinionDelPueblo := ((Dictionary new) add: ('Forastero'->#('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' )); add: ('Prometedor'->#('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' )); yourself).
	cantidadDeInteracciones := 0.
	cantidadDeInteraccionesConPersonajes := ((Dictionary new) add: (#Hamilton->0); yourself).! !


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

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'TV 10/3/2021 00:46:16'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'TV 10/3/2021 00:46:34'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'TV 10/3/2021 00:46:49'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'TV 10/3/2021 00:47:00'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'TV 10/3/2021 00:47:20'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.

	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'TV 10/3/2021 00:47:35'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'TV 10/3/2021 00:47:50'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'TV 10/3/2021 00:48:08'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'TV 10/3/2021 00:48:18'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Salud aventurero!!'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'TV 10/3/2021 00:48:40'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Bienvenido aventurero!!'. ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TV 10/3/2021 00:45:53'!
carolinaLaCurandera
	^ CarolinaLaCurandera .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TV 10/3/2021 00:45:55'!
hamilton
	^#Hamilton .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TV 10/3/2021 13:33:37'!
riverwood
	^PuebloDeRiverwood! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TV 10/3/2021 00:46:01'!
tirion
	^#Tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TV 10/3/2021 00:46:05'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TV 10/3/2021 00:48:49'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^self riverwood loVesPrometedorA:   unPersonaje.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TV 10/3/2021 17:23:54'!
hacerQueLaCuranderaOlvideSusInteracciones
	self carolinaLaCurandera olvidarInteraccionesConTodosLosPersonajes .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TV 10/3/2021 00:48:56'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	self riverwood olvidarOpiniones .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TV 10/3/2021 16:56:51'!
hacerQueRiverwoodVeaPrometedorAHamilton
	self riverwood reconocerComoPrometedorA: self hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TV 10/3/2021 00:49:05'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.! !


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

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'TV 10/3/2021 00:43:42'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'TV 10/3/2021 00:44:42'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'TV 10/3/2021 17:23:54'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidarInteraccionesConTodosLosPersonajes.
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'TV 10/3/2021 00:45:07'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'TV 10/3/2021 00:45:22'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'TV 10/3/2021 00:45:26'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'TV 10/3/2021 00:45:33'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'TV 10/3/2021 00:42:31'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'TV 10/3/2021 00:42:47'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'TV 10/3/2021 00:42:03'!
hamilton
	^#Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'TV 10/3/2021 13:33:37'!
riverwood
	^PuebloDeRiverwood! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'TV 10/3/2021 00:42:08'!
tirion
	^#Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'TV 10/3/2021 00:42:11'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'TV 10/3/2021 17:23:54'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidarInteraccionesConTodosLosPersonajes.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'TV 10/3/2021 00:41:41'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	self riverwood olvidarOpiniones .! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'TV 10/3/2021 16:57:27'!
hacerQueRiverwoodVeaPrometedorAHamilton
	self riverwood reconocerComoPrometedorA: self hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'TV 10/3/2021 00:41:56'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PuebloDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PuebloDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuebloDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
PuebloDeRiverwood class
	instanceVariableNames: 'opinionesDeLosAventureros'!

!PuebloDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 17:34:21'!
consultarConElPuebloSobre: unPersonaje
	^opinionesDeLosAventureros at: unPersonaje ifAbsent: ['Forastero']! !

!PuebloDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 17:54:46'!
hablarConElPuebloParaReconocerComoPrometedorA: unPersonaje
	opinionesDeLosAventureros at: unPersonaje put: 'Prometedor'.
	TreborElGuardiaDeSkyrim olvidarInteraccionesCon: unPersonaje.
	CarolinaLaCurandera olvidarInteraccionesCon: unPersonaje.! !


!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 17:35:36'!
loVesPrometedorA: unPersonaje
	^(self consultarConElPuebloSobre: unPersonaje) isEqualTo: 'Prometedor'.	! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 13:35:41'!
olvidarOpiniones
	opinionesDeLosAventureros  := Dictionary new.! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 17:34:37'!
queOpinasDe: unPersonaje
	^ self consultarConElPuebloSobre: unPersonaje.! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 17:54:46'!
reconocerComoPrometedorA: unPersonaje
	self hablarConElPuebloParaReconocerComoPrometedorA: unPersonaje .! !


!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'TV 10/3/2021 17:56:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	opinionesDeLosAventureros := ((Dictionary new) add: (#Hamilton->'Prometedor'); yourself).! !


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

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 17:23:36'!
interactuarCon: unPersonaje
	self recordarInteraccionCon: unPersonaje.
	^ self responderSegunCantidadDeInteraccionesCon: unPersonaje.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 17:23:47'!
olvidarInteraccionesCon: unPersonaje
	cantidadDeInteraccionesConPersonajes at: unPersonaje put: 0.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'TV 10/3/2021 17:23:54'!
olvidarInteraccionesConTodosLosPersonajes
	cantidadDeInteraccionesConPersonajes := Dictionary new
! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 17:24:13'!
obtenerFrasesPara: unPersonaje
	|opinionDelPueblo |
	opinionDelPueblo := PuebloDeRiverwood queOpinasDe: unPersonaje.
	^frasesParaPersonajesSegunOpinionDelPueblo at: opinionDelPueblo .! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 17:24:23'!
recordarInteraccionCon: unPersonaje
	| interacciones |
	interacciones := cantidadDeInteraccionesConPersonajes at: unPersonaje ifAbsent: [0].
	cantidadDeInteraccionesConPersonajes at: unPersonaje put: interacciones + 1.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'TV 10/3/2021 17:24:30'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	| cantidadDeInteraccionesDelPersonaje frasesParaEstePersonaje|
	cantidadDeInteraccionesDelPersonaje := cantidadDeInteraccionesConPersonajes at: unPersonaje.
	frasesParaEstePersonaje := self obtenerFrasesPara: unPersonaje.
	^ frasesParaEstePersonaje at: (cantidadDeInteraccionesDelPersonaje min: frasesParaEstePersonaje size)! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'TV 10/3/2021 17:56:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPersonajesSegunOpinionDelPueblo := ((Dictionary new) add: ('Forastero'->#('Hola forastero' '¿Todo bien?' '¿Algún problema?' )); add: ('Prometedor'->#('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' )); yourself).
	cantidadDeInteracciones := 0.
	cantidadDeInteraccionesConPersonajes := ((Dictionary new) add: (#Hamilton->2); yourself).! !

CarolinaLaCurandera initializeAfterFileIn!
PuebloDeRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!