!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:53:49'!
test01CuandoNoSeEnvianComandosSeMantieneEnLaPosicionInicialEnDireccionNorte
	|marsRover|
	
	marsRover := MarsRover enDireccion: 'N'.
	
	self assert: (marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:53:57'!
test02CuandoApuntaEnDireccionNorteAvanzaHaciaElNorte
	|marsRover|
	
	marsRover := MarsRover enDireccion: 'N'.
	marsRover recibirComandos: 'f'.
	
	self assert: (marsRover posicionActual = (0@1) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:26:51'!
test03CuandoApuntaEnDireccionNorteRetrocedeEnDireccionNorte
	|marsRover|
	
	marsRover := MarsRover enDireccion: 'N'.
	marsRover recibirComandos: 'b'.
	
	self assert: (marsRover posicionActual = (0@-1) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:26:56'!
test04CuandoApuntaEnDireccionNorteYRotaHaciaLaIzquierdaApuntaHaciaElOeste
	|marsRover|
	
	marsRover := MarsRover enDireccion: 'N'.
	marsRover recibirComandos: 'l'.
	
	self assert: (marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Oeste]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:26:59'!
test05CuandoApuntaEnDireccionNorteYRotaHaciaLaDerechaApuntaHaciaElEste
	|marsRover|
	
	marsRover := MarsRover enDireccion: 'N'.
	marsRover recibirComandos: 'r'.
	
	self assert: (marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Este]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:27:45'!
test06CuandoApuntaEnDireccionOesteAvanzaEnDireccionOeste
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'O'.
	marsRover recibirComandos: 'f'.
	
	self assert:(marsRover posicionActual = (-1@0) and: [marsRover direccionActual isMemberOf: Oeste]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:27:57'!
test07CuandoApuntaEnDireccionOesteRetrocedeEnDireccionOeste
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'O'.
	marsRover recibirComandos: 'b'.
	
	self assert:(marsRover posicionActual = (1@0) and: [marsRover direccionActual isMemberOf: Oeste]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:28:07'!
test08CuandoApuntaEnDireccionOesteYRotaHaciaLaIzquierdaApuntaHaciaElSur
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'O'.
	marsRover recibirComandos: 'l'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Sur]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:28:15'!
test09CuandoApuntaEnDireccionOesteYRotaHaciaLaDerechaApuntaHaciaElNorte
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'O'.
	marsRover recibirComandos: 'r'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:28:29'!
test10CuandoApuntaEnDireccionEsteAvanzaEnDireccionEste
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'E'.
	marsRover recibirComandos: 'f'.
	
	self assert:(marsRover posicionActual = (1@0) and: [marsRover direccionActual isMemberOf: Este]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:28:42'!
test11CuandoApuntaEnDireccionEsteRetrocedeEnDireccionEste
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'E'.
	marsRover recibirComandos: 'b'.
	
	self assert:(marsRover posicionActual = (-1@0) and: [marsRover direccionActual isMemberOf: Este]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:28:52'!
test12CuandoApuntaEnDireccionEsteYRotaHaciaLaIzquierdaApuntaEnDireccionNorte
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'E'.
	marsRover recibirComandos: 'l'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:30:17'!
test13CuandoApuntaEnDireccionEsteYRotaHaciaLaDerechaApuntaEnDireccionSur
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'E'.
	marsRover recibirComandos: 'r'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Sur]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:32:13'!
test14CuandoApuntaEnDireccionSurAvanzaEnDireccionSur
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'S'.
	marsRover recibirComandos: 'f'.
	
	self assert:(marsRover posicionActual = (0@-1) and: [marsRover direccionActual isMemberOf: Sur]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:32:33'!
test15CuandoApuntaEnDireccionSurRetrocedeEnDireccionSur
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'S'.
	marsRover recibirComandos: 'b'.
	
	self assert:(marsRover posicionActual = (0@1) and: [marsRover direccionActual isMemberOf: Sur]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:32:48'!
test16CuandoApuntaEnDireccionSurYRotaHaciaLaIzquierdaApuntaEnDireccionEste
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'S'.
	marsRover recibirComandos: 'l'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Este]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:32:59'!
test17CuandoApuntaEnDireccionSurYRotaHaciaLaDerechaApuntaEnDireccionOeste
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'S'.
	marsRover recibirComandos: 'r'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Oeste]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 14:54:55'!
test18CuandoSeIngresanComandosInvalidosElMarsRoverSeDetiene
	| marsRover |
	
	marsRover := MarsRover enDireccion: 'N'.
	self
		should: [ marsRover recibirComandos: 'x']
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: (marsRover class errorComandoInvalido)].
		
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'direccionActual posicionActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'comandos' stamp: 'TV 11/18/2021 02:09:38'!
avanzar
	direccionActual moverHaciaAdelante: self.! !

!MarsRover methodsFor: 'comandos' stamp: 'TV 11/18/2021 14:41:30'!
recibirComandos: unosComandos
	unosComandos do: [: unComando| self ejecutar: unComando].! !

!MarsRover methodsFor: 'comandos' stamp: 'TV 11/18/2021 02:28:58'!
retroceder
	direccionActual moverHaciaAtras: self! !

!MarsRover methodsFor: 'comandos' stamp: 'TV 11/18/2021 02:36:44'!
rotarHaciaLaDerecha
	direccionActual rotarHaciaLaDerecha: self.! !

!MarsRover methodsFor: 'comandos' stamp: 'TV 11/18/2021 02:33:17'!
rotarHaciaLaIzquierda
	direccionActual rotarHaciaLaIzquierda: self.! !


!MarsRover methodsFor: 'initialization' stamp: 'TV 11/18/2021 14:24:07'!
inicializarEnDireccion: unaPosibleDireccion
	direccionActual := PuntosCardinales apuntandoEn: unaPosibleDireccion.
	posicionActual := 0@0.! !


!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 14:44:38'!
ejecutar: unComando
			(unComando = $f) ifTrue: [self avanzar]
		ifFalse:
			[(unComando = $b) ifTrue: [self retroceder] 
		ifFalse: 
			[(unComando = $r) ifTrue: [self rotarHaciaLaDerecha]
		ifFalse: 
			[(unComando = $l) ifTrue: [self rotarHaciaLaIzquierda] 
		ifFalse:
			[self error: 'Comando invalido'].
			]
		]
	].
! !


!MarsRover methodsFor: 'testing - privado' stamp: 'TV 11/18/2021 02:13:47'!
direccionActual
	^direccionActual.! !

!MarsRover methodsFor: 'testing - privado' stamp: 'TV 11/18/2021 02:13:56'!
posicionActual
	^posicionActual.! !


!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 13:54:37'!
avanzarEnDireccionEste
	self desplazarseEn: (1@0).! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 13:54:51'!
avanzarEnDireccionNorte
	self desplazarseEn: (0@1).! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 13:54:57'!
avanzarEnDireccionOeste
	self desplazarseEn: (-1@0).! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 13:55:04'!
avanzarEnDireccionSur
	self desplazarseEn: (0@-1).! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 13:54:17'!
desplazarseEn: unPunto
	posicionActual := posicionActual + (unPunto).! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 13:55:20'!
retrocederEnDireccionEste
	self desplazarseEn:(-1@0).! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 13:55:29'!
retrocederEnDireccionNorte
	self desplazarseEn: (0@-1).! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 13:55:34'!
retrocederEnDireccionOeste
	self desplazarseEn: (1@0).! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 13:55:38'!
retrocederEnDireccionSur
	self desplazarseEn: (0@1)! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 02:38:03'!
rotarHaciaElEste
	direccionActual := Este new.! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 02:46:23'!
rotarHaciaElNorte
	direccionActual := Norte new.! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 02:35:24'!
rotarHaciaElOeste
	direccionActual := Oeste new.! !

!MarsRover methodsFor: 'movimientos - privado' stamp: 'TV 11/18/2021 02:43:17'!
rotarHaciaElSur
	direccionActual := Sur new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: 'posicionActual'!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 14:26:13'!
enDireccion: unaPosibleDireccion
	^self new inicializarEnDireccion: unaPosibleDireccion.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 14:54:24'!
errorComandoInvalido
	^'Comando invalido'.! !


!classDefinition: #PuntosCardinales category: 'MarsRover'!
Object subclass: #PuntosCardinales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntosCardinales methodsFor: 'operaciones' stamp: 'TV 11/18/2021 03:11:55'!
moverHaciaAdelante: unMarsRover
	self subclassResponsibility.! !

!PuntosCardinales methodsFor: 'operaciones' stamp: 'TV 11/18/2021 03:12:05'!
moverHaciaAtras: unMarsRover
	self subclassResponsibility.! !

!PuntosCardinales methodsFor: 'operaciones' stamp: 'TV 11/18/2021 03:12:20'!
rotarHaciaLaDerecha: unMarsRover
	self subclassResponsibility.! !

!PuntosCardinales methodsFor: 'operaciones' stamp: 'TV 11/18/2021 03:12:14'!
rotarHaciaLaIzquierda: unMarsRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuntosCardinales class' category: 'MarsRover'!
PuntosCardinales class
	instanceVariableNames: ''!

!PuntosCardinales class methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 14:25:53'!
apuntandoEn: unaPosibleDireccion
	|subclaseSeleccionada|
	subclaseSeleccionada := self subclasses detect: [:subclase| subclase estaDireccionTeCorresponde: unaPosibleDireccion].
	^subclaseSeleccionada new.
	! !


!classDefinition: #Este category: 'MarsRover'!
PuntosCardinales subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:53:44'!
moverHaciaAdelante: unMarsRover
	unMarsRover avanzarEnDireccionEste.! !

!Este methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:56:42'!
moverHaciaAtras: unMarsRover
	unMarsRover retrocederEnDireccionEste.! !

!Este methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:44:18'!
rotarHaciaLaDerecha: unMarsRover
	unMarsRover rotarHaciaElSur.! !

!Este methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:45:58'!
rotarHaciaLaIzquierda: unMarsRover 
	unMarsRover rotarHaciaElNorte.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: 'MarsRover'!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'as yet unclassified' stamp: 'TV 11/16/2021 23:35:41'!
estaDireccionTeCorresponde: unaDireccion
	^unaDireccion = 'E'.! !


!classDefinition: #Norte category: 'MarsRover'!
PuntosCardinales subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:10:23'!
moverHaciaAdelante: unMarsRover
	unMarsRover avanzarEnDireccionNorte! !

!Norte methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:29:25'!
moverHaciaAtras: unMarsRover
	unMarsRover retrocederEnDireccionNorte.! !

!Norte methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:37:36'!
rotarHaciaLaDerecha: unMarsRover
	unMarsRover rotarHaciaElEste.! !

!Norte methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:34:24'!
rotarHaciaLaIzquierda: unMarsRover
	unMarsRover rotarHaciaElOeste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: 'MarsRover'!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'as yet unclassified' stamp: 'TV 11/16/2021 23:35:53'!
estaDireccionTeCorresponde: unaDireccion
	^unaDireccion = 'N'.! !


!classDefinition: #Oeste category: 'MarsRover'!
PuntosCardinales subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:50:06'!
moverHaciaAdelante: unMarsRover
	unMarsRover avanzarEnDireccionOeste.! !

!Oeste methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:51:51'!
moverHaciaAtras: unMarsRover
	unMarsRover retrocederEnDireccionOeste.! !

!Oeste methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:47:37'!
rotarHaciaLaDerecha: unMarsRover 
	unMarsRover rotarHaciaElNorte.! !

!Oeste methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:43:07'!
rotarHaciaLaIzquierda: unMarsRover
	unMarsRover rotarHaciaElSur.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: 'MarsRover'!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'as yet unclassified' stamp: 'TV 11/16/2021 23:35:58'!
estaDireccionTeCorresponde: unaDireccion
	^unaDireccion = 'O'.! !


!classDefinition: #Sur category: 'MarsRover'!
PuntosCardinales subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'operaciones' stamp: 'TV 11/18/2021 02:59:46'!
moverHaciaAdelante: unMarsRover
	unMarsRover avanzarEnDireccionSur.! !

!Sur methodsFor: 'operaciones' stamp: 'TV 11/18/2021 03:02:59'!
moverHaciaAtras: unMarsRover
	unMarsRover retrocederEnDireccionSur.! !

!Sur methodsFor: 'operaciones' stamp: 'TV 11/18/2021 03:09:39'!
rotarHaciaLaDerecha: unMarsRover 
	unMarsRover rotarHaciaElOeste.! !

!Sur methodsFor: 'operaciones' stamp: 'TV 11/18/2021 03:07:37'!
rotarHaciaLaIzquierda: unMarsRover
	unMarsRover rotarHaciaElEste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'MarsRover'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'TV 11/16/2021 23:36:03'!
estaDireccionTeCorresponde: unaDireccion
	^unaDireccion = 'S'.! !
