!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:18:04'!
test01CuandoNoSeEnvianComandosSeMantieneEnLaPosicionInicialEnDireccionNorte
	|marsRover|
	
	marsRover := MarsRover new.
	
	self assert: (marsRover posicionActual = (0@0) and: [marsRover direccionActual isKindOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:28:18'!
test02
	|marsRover|
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'f'.
	
	self assert: (marsRover posicionActual = (0@1) and: [marsRover direccionActual isKindOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:30:01'!
test03
	|marsRover|
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'b'.
	
	self assert: (marsRover posicionActual = (0@-1) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:30:55'!
test04
	|marsRover|
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'l'.
	
	self assert: (marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Oeste]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:35:51'!
test05
	|marsRover|
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'r'.
	
	self assert: (marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Este]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:40:41'!
test06
	|marsRover|
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'ff'.
	
	self assert: (marsRover posicionActual = (0@2) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:40:55'!
test07
	|marsRover|
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'bb'.
	
	self assert: (marsRover posicionActual = (0@-2) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:41:13'!
test08
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'll'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Sur]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:43:38'!
test09
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'rr'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Sur]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:45:40'!
test10
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'rl'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:47:46'!
test11
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'lr'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Norte]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:49:22'!
test12
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'lf'.
	
	self assert:(marsRover posicionActual = (-1@0) and: [marsRover direccionActual isMemberOf: Oeste]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:53:05'!
test13
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'lb'.
	
	self assert:(marsRover posicionActual = (1@0) and: [marsRover direccionActual isMemberOf: Oeste]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:55:01'!
test14
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'rf'.
	
	self assert:(marsRover posicionActual = (1@0) and: [marsRover direccionActual isMemberOf: Este]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 02:55:18'!
test15
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'rb'.
	
	self assert:(marsRover posicionActual = (-1@0) and: [marsRover direccionActual isMemberOf: Este]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 03:00:19'!
test16
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'llf'.
	
	self assert:(marsRover posicionActual = (0@-1) and: [marsRover direccionActual isMemberOf: Sur]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 03:02:36'!
test17
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'llb'.
	
	self assert:(marsRover posicionActual = (0@1) and: [marsRover direccionActual isMemberOf: Sur]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 03:10:27'!
test18
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'lll'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Este]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 03:10:34'!
test19
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover recibirComandos: 'rrr'.
	
	self assert:(marsRover posicionActual = (0@0) and: [marsRover direccionActual isMemberOf: Oeste]).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 03:11:00'!
test20
	| marsRover |
	
	marsRover := MarsRover new.
	
	self
		should: [ marsRover recibirComandos: 'x']
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: 'Comando invalido'].
		
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

!MarsRover methodsFor: 'comandos' stamp: 'TV 11/18/2021 03:14:22'!
recibirComandos: unosComandos
	unosComandos do:[: unComando|
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
	]
].
! !

!MarsRover methodsFor: 'comandos' stamp: 'TV 11/18/2021 02:28:58'!
retroceder
	direccionActual moverHaciaAtras: self! !

!MarsRover methodsFor: 'comandos' stamp: 'TV 11/18/2021 02:36:44'!
rotarHaciaLaDerecha
	direccionActual rotarHaciaLaDerecha: self.! !

!MarsRover methodsFor: 'comandos' stamp: 'TV 11/18/2021 02:33:17'!
rotarHaciaLaIzquierda
	direccionActual rotarHaciaLaIzquierda: self.! !


!MarsRover methodsFor: 'initialization' stamp: 'TV 11/18/2021 02:27:56'!
initialize
	direccionActual := Norte new.
	posicionActual := 0@0.! !


!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:54:18'!
avanzarEnDireccionEste
	posicionActual := posicionActual + (1@0).! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:12:19'!
avanzarEnDireccionNorte
	posicionActual := posicionActual + (0@1).! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:50:49'!
avanzarEnDireccionOeste
	posicionActual := 	posicionActual + (-1@0).! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 03:00:07'!
avanzarEnDireccionSur
	posicionActual := posicionActual + (0@-1).! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:57:09'!
retrocederEnDireccionEste
	posicionActual := posicionActual + (-1@0).! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:29:43'!
retrocederEnDireccionNorte
	posicionActual := posicionActual + (0@-1).! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:52:34'!
retrocederEnDireccionOeste
	posicionActual := posicionActual + (1@0).! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 03:03:19'!
retrocederEnDireccionSur
	posicionActual := posicionActual + (0@1)! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:38:03'!
rotarHaciaElEste
	direccionActual := Este new.! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:46:23'!
rotarHaciaElNorte
	direccionActual := Norte new.! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:35:24'!
rotarHaciaElOeste
	direccionActual := Oeste new.! !

!MarsRover methodsFor: 'comandos - privado' stamp: 'TV 11/18/2021 02:43:17'!
rotarHaciaElSur
	direccionActual := Sur new.! !


!MarsRover methodsFor: 'privado' stamp: 'TV 11/18/2021 02:13:47'!
direccionActual
	^direccionActual.! !

!MarsRover methodsFor: 'privado' stamp: 'TV 11/18/2021 02:13:56'!
posicionActual
	^posicionActual.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: 'posicionActual'!


!classDefinition: #PuntosCardinales category: 'MarsRover'!
Object subclass: #PuntosCardinales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntosCardinales methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 03:11:55'!
moverHaciaAdelante: unMarsRover
	self subclassResponsibility.! !

!PuntosCardinales methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 03:12:05'!
moverHaciaAtras: unMarsRover
	self subclassResponsibility.! !

!PuntosCardinales methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 03:12:20'!
rotarHaciaLaDerecha: unMarsRover
	self subclassResponsibility.! !

!PuntosCardinales methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 03:12:14'!
rotarHaciaLaIzquierda: unMarsRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuntosCardinales class' category: 'MarsRover'!
PuntosCardinales class
	instanceVariableNames: ''!

!PuntosCardinales class methodsFor: 'as yet unclassified' stamp: 'TV 11/16/2021 23:35:16'!
Con: unaDireccion
	|subclaseSeleccionada|
	subclaseSeleccionada := self subclasses detect: [:subclase| subclase estaDireccionTeCorresponde: unaDireccion].
	^subclaseSeleccionada new.
	! !


!classDefinition: #Este category: 'MarsRover'!
PuntosCardinales subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:53:44'!
moverHaciaAdelante: unMarsRover
	unMarsRover avanzarEnDireccionEste.! !

!Este methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:56:42'!
moverHaciaAtras: unMarsRover
	unMarsRover retrocederEnDireccionEste.! !

!Este methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:44:18'!
rotarHaciaLaDerecha: unMarsRover
	unMarsRover rotarHaciaElSur.! !

!Este methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:45:58'!
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

!Norte methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:10:23'!
moverHaciaAdelante: unMarsRover
	unMarsRover avanzarEnDireccionNorte! !

!Norte methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:29:25'!
moverHaciaAtras: unMarsRover
	unMarsRover retrocederEnDireccionNorte.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:37:36'!
rotarHaciaLaDerecha: unMarsRover
	unMarsRover rotarHaciaElEste.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:34:24'!
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

!Oeste methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:50:06'!
moverHaciaAdelante: unMarsRover
	unMarsRover avanzarEnDireccionOeste.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:51:51'!
moverHaciaAtras: unMarsRover
	unMarsRover retrocederEnDireccionOeste.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:47:37'!
rotarHaciaLaDerecha: unMarsRover 
	unMarsRover rotarHaciaElNorte.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:43:07'!
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

!Sur methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 02:59:46'!
moverHaciaAdelante: unMarsRover
	unMarsRover avanzarEnDireccionSur.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 03:02:59'!
moverHaciaAtras: unMarsRover
	unMarsRover retrocederEnDireccionSur.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 03:09:39'!
rotarHaciaLaDerecha: unMarsRover 
	unMarsRover rotarHaciaElOeste.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'TV 11/18/2021 03:07:37'!
rotarHaciaLaIzquierda: unMarsRover
	unMarsRover rotarHaciaElEste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'MarsRover'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'TV 11/16/2021 23:36:03'!
estaDireccionTeCorresponde: unaDireccion
	^unaDireccion = 'S'.! !
