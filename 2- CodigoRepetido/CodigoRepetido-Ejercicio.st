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

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/13/2021 23:10:15'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook runningTime |
	
	customerBook := CustomerBook new.
	runningTime:= self getRunningTimeOf: [customerBook addCustomerNamed: 'John Lennon'.].
	
	self assert: runningTime < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/13/2021 23:37:47'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook runningTime |
	
	customerBook := CustomerBook withCustomerNamed: 'Paul McCartney'.
	runningTime := self getRunningTimeOf: [customerBook removeCustomerNamed: 'Paul McCartney' ].
	self assert: runningTime < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/13/2021 23:56:28'!
test03CanNotAddACustomerWithEmptyName 
	| customerBook closure action |
	"Preguntar"			
	customerBook := CustomerBook new.
	closure := [customerBook addCustomerNamed: ''].
	action := [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
			
	self closureThatMustFail: closure withError: Error atErrorDo: action.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/13/2021 23:55:57'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook closure action |
	"Preguntar"			
	customerBook := CustomerBook withCustomerNamed: 'John Lennon'.
	closure := [customerBook removeCustomerNamed: 'Paul McCartney'.].
	action := [:anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon')].
	
	self closureThatMustFail: closure withError: NotFound atErrorDo: action.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/13/2021 23:37:47'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook withCustomerNamed: 'Paul McCartney'.
	
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	
	self checkValuesOf: customerBook  expectedActiveCustomers: 0 expectedSuspendedCustomers: 1  expectedCustomers: 1.
	self assert: (customerBook includesCustomerNamed: 'Paul McCartney').
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/13/2021 23:37:46'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook withCustomerNamed: 'Paul McCartney'.
	
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self checkValuesOf: customerBook  expectedActiveCustomers: 0 expectedSuspendedCustomers: 0  expectedCustomers: 0.
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/13/2021 23:49:27'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook action closure |
			
	customerBook := CustomerBook withCustomerNamed: 'John Lennon'.
	closure := [customerBook suspendCustomerNamed: 'Ringo Starr'].
	action := [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ].
	
	self closureThatMustFail: closure withError: CantSuspend atErrorDo: action.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/13/2021 23:59:25'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook closure action |		
	customerBook := CustomerBook withCustomerNamed: 'John Lennon'.
	customerBook suspendCustomerNamed: 'John Lennon'.
	
	closure := [customerBook suspendCustomerNamed: 'John Lennon'].
	action := [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ].
		
	self closureThatMustFail: closure withError: CantSuspend  atErrorDo: action.
! !


!CustomerBookTest methodsFor: 'testHelpers' stamp: 'TV 10/13/2021 23:28:05'!
checkValuesOf: customerBook expectedActiveCustomers: activeCustomers expectedSuspendedCustomers: suspendedCustomers expectedCustomers: customers
	"Preguntar"	
	self assert: activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: customers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'TV 10/13/2021 23:31:14'!
closureThatMustFail: closure withError: error atErrorDo: action
	[ closure value.
	self fail	]
		on: error
		do:[action
			].
! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'TV 10/13/2021 23:10:33'!
getRunningTimeOf: thisClosure
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	thisClosure value.
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

!CustomerBook methodsFor: 'customer management' stamp: 'TV 10/13/2021 22:58:23'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent:[suspended remove: aName ifAbsent: [^NotFound signal.].].
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


!CustomerBook class methodsFor: 'initializers' stamp: 'TV 10/13/2021 23:37:46'!
withCustomerNamed: aName
	|customerBook |
	customerBook := self new.
	customerBook addCustomerNamed: aName.
	^customerBook.! !
