!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test01CuandoNoSeEnvianComandosSeMantieneEnLaPosicionInicialEnDireccionNorte
	
	self asegurarQueElMarsRoverApunte: 'N' ejecute: '' termineEn: (0@0) en: 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test02CuandoApuntaEnDireccionNorteAvanzaHaciaElNorte

	self asegurarQueElMarsRoverApunte: 'N' ejecute: 'f' termineEn: (0@1) en: 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test03CuandoApuntaEnDireccionNorteRetrocedeEnDireccionNorte
	
	self asegurarQueElMarsRoverApunte: 'N' ejecute: 'b' termineEn: (0@-1) en: 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test04CuandoApuntaEnDireccionNorteYRotaHaciaLaIzquierdaApuntaHaciaElOeste
	
	self asegurarQueElMarsRoverApunte: 'N' ejecute: 'l' termineEn: (0@0) en: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test05CuandoApuntaEnDireccionNorteYRotaHaciaLaDerechaApuntaHaciaElEste

	self asegurarQueElMarsRoverApunte: 'N' ejecute: 'r' termineEn: (0@0) en: 'E'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test06CuandoApuntaEnDireccionOesteAvanzaEnDireccionOeste.

	self asegurarQueElMarsRoverApunte: 'O' ejecute: 'f' termineEn: (-1@0) en: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test07CuandoApuntaEnDireccionOesteRetrocedeEnDireccionOeste

	self asegurarQueElMarsRoverApunte: 'O' ejecute: 'b' termineEn: (1@0) en: 'O'.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test08CuandoApuntaEnDireccionOesteYRotaHaciaLaIzquierdaApuntaHaciaElSur

	self asegurarQueElMarsRoverApunte: 'O' ejecute: 'l' termineEn: (0@0) en: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test09CuandoApuntaEnDireccionOesteYRotaHaciaLaDerechaApuntaHaciaElNorte

	self asegurarQueElMarsRoverApunte: 'O' ejecute: 'r' termineEn: (0@0) en: 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test10CuandoApuntaEnDireccionEsteAvanzaEnDireccionEste

	self asegurarQueElMarsRoverApunte: 'E' ejecute: 'f' termineEn: (1@0) en: 'E'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test11CuandoApuntaEnDireccionEsteRetrocedeEnDireccionEste

	self asegurarQueElMarsRoverApunte: 'E' ejecute: 'b' termineEn: (-1@0) en: 'E'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test12CuandoApuntaEnDireccionEsteYRotaHaciaLaIzquierdaApuntaEnDireccionNorte

	self asegurarQueElMarsRoverApunte: 'E' ejecute: 'l' termineEn: (0@0) en: 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test13CuandoApuntaEnDireccionEsteYRotaHaciaLaDerechaApuntaEnDireccionSur

	self asegurarQueElMarsRoverApunte: 'E' ejecute: 'r' termineEn: (0@0) en: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test14CuandoApuntaEnDireccionSurAvanzaEnDireccionSur

	self asegurarQueElMarsRoverApunte: 'S' ejecute: 'f' termineEn: (0@-1) en: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test15CuandoApuntaEnDireccionSurRetrocedeEnDireccionSur

	self asegurarQueElMarsRoverApunte: 'S' ejecute: 'b' termineEn: (0@1) en: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test16CuandoApuntaEnDireccionSurYRotaHaciaLaIzquierdaApuntaEnDireccionEste

	self asegurarQueElMarsRoverApunte: 'S' ejecute: 'l' termineEn: (0@0) en: 'E'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 17:48:34'!
test17CuandoApuntaEnDireccionSurYRotaHaciaLaDerechaApuntaEnDireccionOeste

	self asegurarQueElMarsRoverApunte: 'S' ejecute: 'r' termineEn: (0@0) en: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'TV 11/18/2021 18:17:57'!
test18CuandoSeIngresanComandosInvalidosElMarsRoverSeDetiene

	self
		should: [self asegurarQueElMarsRoverApunte: 'N' ejecute: 'fx' termineEn: (0@1) en: 'N']
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: (MarsRover descripcionErrorComandoInvalido)].
		
	! !


!MarsRoverTest methodsFor: 'assertions - private' stamp: 'TV 11/18/2021 18:02:39'!
asegurarQue: unMarsRover apunteEn: unaDireccion
	self assert: unaDireccion equals: unMarsRover direccionActual.
	! !

!MarsRoverTest methodsFor: 'assertions - private' stamp: 'TV 11/18/2021 18:04:32'!
asegurarQue: unMarsRover esteEn: unaPosicion
	self assert: unaPosicion equals: unMarsRover posicionActual.! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'TV 11/18/2021 18:03:28'!
asegurarQueElMarsRoverApunte: enUnaDireccion ejecute: unosComandos termineEn: otraPosicion en: otraDireccion
	| marsRover |
 	
	marsRover := MarsRover enDireccion: enUnaDireccion.
	marsRover recibirComandos: unosComandos.

	self asegurarQue: marsRover apunteEn: otraDireccion.
	self asegurarQue: marsRover esteEn: otraPosicion.! !


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


!MarsRover methodsFor: 'testing' stamp: 'TV 11/18/2021 17:09:11'!
direccionActual
	^direccionActual direccion.! !

!MarsRover methodsFor: 'testing' stamp: 'TV 11/18/2021 17:59:57'!
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

!MarsRover class methodsFor: 'instance creation' stamp: 'TV 11/18/2021 14:26:13'!
enDireccion: unaPosibleDireccion
	^self new inicializarEnDireccion: unaPosibleDireccion.! !


!MarsRover class methodsFor: 'error descriptions' stamp: 'TV 11/18/2021 18:16:40'!
descripcionErrorComandoInvalido
	^'Comando invalido'.! !


!classDefinition: #PuntosCardinales category: 'MarsRover'!
Object subclass: #PuntosCardinales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntosCardinales methodsFor: 'testing' stamp: 'TV 11/18/2021 17:11:40'!
direccion
	self subclassResponsibility.
	! !


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


!Este methodsFor: 'testing' stamp: 'TV 11/18/2021 17:04:20'!
direccion
	^'E'.! !

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


!Norte methodsFor: 'testing' stamp: 'TV 11/18/2021 17:08:26'!
direccion
	^'N'.! !

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


!Oeste methodsFor: 'testing' stamp: 'TV 11/18/2021 17:14:45'!
direccion
	^'O'.! !

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


!Sur methodsFor: 'testing' stamp: 'TV 11/18/2021 17:13:56'!
direccion
	^'S'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'MarsRover'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'TV 11/16/2021 23:36:03'!
estaDireccionTeCorresponde: unaDireccion
	^unaDireccion = 'S'.! !
