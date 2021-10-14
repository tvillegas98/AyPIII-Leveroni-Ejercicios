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
	instanceVariableNames: 'johnLennon ringoStarr paulMcCartney customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/14/2021 16:19:08'!
setUp
	johnLennon := 'John Lennon'.
	ringoStarr := 'Ringo Starr'.
	paulMcCartney := 'Paul McCartney'.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/14/2021 17:28:40'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| runningTime |
	
	customerBook := CustomerBook new.
	runningTime := Time millisecondsToRun: (self closureAddCustomerNamed: johnLennon).
	self assert: runningTime < (50 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/14/2021 17:29:10'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| runningTime |
	
	customerBook := CustomerBook withCustomerNamed: paulMcCartney .
	runningTime := Time millisecondsToRun: (self closureRemoveCustomerNamed: paulMcCartney).
	self assert: runningTime < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/14/2021 17:39:34'!
test03CanNotAddACustomerWithEmptyName 
	
	customerBook := CustomerBook new.
			
	self closureThatMustFail: (self closureAddCustomerNamed: '') withError: Error atErrorDo: (self actionAtEmptyCustomerError ).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/14/2021 17:32:20'!
test04CanNotRemoveAnInvalidCustomer
	customerBook := CustomerBook withCustomerNamed: johnLennon .
	
	self closureThatMustFail: (self closureRemoveCustomerNamed: paulMcCartney) withError: NotFound atErrorDo: (self checkIfNumberOfCustomersIs: 1 withCustomer: johnLennon).
.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/14/2021 17:20:05'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	customerBook := CustomerBook withCustomerNamed: paulMcCartney .
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self checkIfexpectedActiveCustomersAre: 0 andExpectedSuspendedCustomersAre: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/14/2021 17:20:05'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	customerBook := CustomerBook withCustomerNamed: paulMcCartney .
	
	customerBook suspendCustomerNamed:paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self checkIfexpectedActiveCustomersAre: 0 andExpectedSuspendedCustomersAre: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/14/2021 17:33:49'!
test07CanNotSuspendAnInvalidCustomer
			
	customerBook := CustomerBook withCustomerNamed: johnLennon .
	
	self closureThatMustFail: (self closureSuspendCustomerNamed: ringoStarr) withError: CantSuspend atErrorDo: (self checkIfNumberOfCustomersIs: 1 withCustomer: johnLennon).
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TV 10/14/2021 17:35:03'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	customerBook := CustomerBook withCustomerNamed: johnLennon .
	customerBook suspendCustomerNamed: johnLennon.	
		
	self closureThatMustFail: (self closureSuspendCustomerNamed: johnLennon) withError: CantSuspend  atErrorDo: (self checkIfNumberOfCustomersIs: 1 withCustomer: johnLennon).
! !


!CustomerBookTest methodsFor: 'test helpers' stamp: 'TV 10/14/2021 17:38:53'!
actionAtEmptyCustomerError
	^[ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'test helpers' stamp: 'TV 10/14/2021 17:06:16'!
checkIfNumberOfCustomersIs: numberOfCustomers withCustomer: customerName
	^[ :anError | 
			self assert: customerBook numberOfCustomers = numberOfCustomers.
			self assert: (customerBook includesCustomerNamed: customerName)].! !

!CustomerBookTest methodsFor: 'test helpers' stamp: 'TV 10/14/2021 17:20:05'!
checkIfexpectedActiveCustomersAre: activeCustomers andExpectedSuspendedCustomersAre: suspendedCustomers
	self assert: activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: activeCustomers + suspendedCustomers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'test helpers' stamp: 'TV 10/14/2021 17:26:05'!
closureAddCustomerNamed: customerName
	^[customerBook addCustomerNamed: customerName].! !

!CustomerBookTest methodsFor: 'test helpers' stamp: 'TV 10/14/2021 17:25:41'!
closureRemoveCustomerNamed: customerName
	^[customerBook removeCustomerNamed: customerName].! !

!CustomerBookTest methodsFor: 'test helpers' stamp: 'TV 10/14/2021 17:33:21'!
closureSuspendCustomerNamed: customerName
	^[customerBook suspendCustomerNamed: customerName].! !

!CustomerBookTest methodsFor: 'test helpers' stamp: 'TV 10/14/2021 15:57:54'!
closureThatMustFail: closure withError: error atErrorDo: action
	[ closure value.
	self fail	]
		on: error
		do: action.
! !


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

!CustomerBook methodsFor: 'customer management' stamp: 'TV 10/14/2021 15:09:39'!
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
