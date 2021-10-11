!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/11/2021 17:55:21'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook runningTime |
	
	customerBook := CustomerBook new.
	runningTime:= self tiempoParaEjecutar: [customerBook addCustomerNamed: 'John Lennon'.].
	
	self assert: runningTime < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/11/2021 18:02:51'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook runningTime |
	
	customerBook := CustomerBook conCustomerName: 'Paul McCartney'.
	runningTime := self tiempoParaEjecutar: [customerBook removeCustomerNamed: 'Paul McCartney' ].
	self assert: runningTime < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/11/2021 19:54:16'!
test03CanNotAddACustomerWithEmptyName 
	| customerBook situacionDelObjeto bloqueDeCodigo |
	"Preguntar"			
	customerBook := CustomerBook new.
	bloqueDeCodigo:= [customerBook addCustomerNamed: ''].
	situacionDelObjeto:= [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
			
	self bloqueDeCodigoQueDebeFallar:bloqueDeCodigo ConElError: Error debeCumplirQue: situacionDelObjeto.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/11/2021 19:54:10'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook bloqueDeCodigo situacionDelObjeto |
	"Preguntar"			
	customerBook := CustomerBook conCustomerName: 'John Lennon'.
	bloqueDeCodigo := [customerBook removeCustomerNamed: 'Paul McCartney'.].
	situacionDelObjeto:= [:anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon')
		].
	
	self bloqueDeCodigoQueDebeFallar: bloqueDeCodigo ConElError: NotFound debeCumplirQue: situacionDelObjeto.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/11/2021 18:58:30'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook conCustomerName: 'Paul McCartney'.
	
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	
	self checkValuesOf: customerBook  ActiveCustomers: 0 SuspendedCustomers: 1  Customers: 1.
	self assert: (customerBook includesCustomerNamed: 'Paul McCartney').
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/11/2021 18:57:55'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook conCustomerName: 'Paul McCartney'.
	
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self checkValuesOf: customerBook  ActiveCustomers: 0 SuspendedCustomers: 0  Customers: 0.
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/11/2021 19:05:06'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook conCustomerName: 'John Lennon'.

	self fallaElSuspenderA: 'Ringo Starr' En: customerBook.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/11/2021 19:04:50'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
			
	customerBook := CustomerBook conCustomerName: 'John Lennon'.
	customerBook suspendCustomerNamed: 'John Lennon'.
	
	self fallaElSuspenderA: 'John Lennon' En: customerBook.
! !


!CustomerBookTest methodsFor: 'testHelpers' stamp: 'TV 10/11/2021 18:42:07'!
bloqueDeCodigoQueDebeFallar: bloqueDeCodigo ConElError: error debeCumplirQue: condicion
	[ bloqueDeCodigo value.
	self fail	]
		on: error
		do:[condicion
			].
! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'TV 10/11/2021 19:54:29'!
checkValuesOf: customerBook ActiveCustomers: activeCustomers SuspendedCustomers: suspendedCustomers Customers: customers
	"Preguntar"	
	self assert: activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: customers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'TV 10/11/2021 19:03:31'!
fallaElSuspenderA: customerName En: customerBook
	[ customerBook suspendCustomerNamed: customerName.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ].! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'TV 10/11/2021 17:53:06'!
tiempoParaEjecutar: bloqueDeCodigo
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	bloqueDeCodigo value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^(millisecondsAfterRunning - millisecondsBeforeRunning).! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'TV 10/11/2021 13:05:11'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'TV 10/11/2021 13:05:07'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'TV 10/11/2021 19:47:22'!
remove: name from: list
	1 to: list size do: 
	[ :index |
		name = (list at: index)
			ifTrue: [
				list removeAt: index.
				^name
			]
	].! !

!CustomerBook methodsFor: 'customer management' stamp: 'TV 10/11/2021 19:49:58'!
removeCustomerNamed: aName 
	|iterable|
	
	iterable := active select: [:currentName| aName = currentName.].
	iterable do: [:name| ^self remove: name from: active.].
	
	iterable := suspended select: [:currentName| aName = currentName].
	iterable do: [:name| ^self remove: name from: suspended.].
	
	^NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'TV 10/11/2021 13:05:25'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'TV 10/11/2021 13:05:33'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'TV 10/11/2021 13:05:36'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'TV 10/11/2021 13:05:42'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'TV 10/11/2021 13:06:02'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'TV 10/11/2021 13:05:50'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'TV 10/11/2021 13:06:06'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'TV 10/11/2021 13:06:10'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'TV 10/11/2021 17:56:35'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'TV 10/11/2021 17:56:40'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!CustomerBook class methodsFor: 'initializers' stamp: 'TV 10/11/2021 18:04:32'!
conCustomerName: customerName
	|customerBook|
	customerBook := self new.
	customerBook addCustomerNamed: customerName.
	^customerBook.! !
