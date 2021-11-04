!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 17:49:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	"Solo cambie los nombres por la subclasificacion. Además como solo delegamos la responsabilidad
	del push a las subclases, testeamos los comportamientos de la clase de la cual subclasificamos.
	"
	stack := OONotLimitedStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:28:26'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OONotLimitedStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:28:29'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OONotLimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:28:32'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OONotLimitedStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:28:35'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OONotLimitedStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:28:38'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OONotLimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:28:42'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OONotLimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:28:49'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OONotLimitedStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:28:54'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OONotLimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:28:58'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OONotLimitedStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/4/2021 15:29:16'!
test11CanNotPopWhenThereStackReachedItsMaxSize
	|limitedStack |
	limitedStack := OOLimitedStack with: 2.
	limitedStack push: 'hola'.
	limitedStack push: 'hola'.
	self
		should: [ limitedStack push: 'hola'. ]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: OOLimitedStack maxSizeReachedError].
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceFinder stack limitedStack filteredWords expectedWords'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'TV 11/4/2021 17:01:14'!
setUp
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OONotLimitedStack new.
	filteredWords := OrderedCollection new.
	expectedWords := OrderedCollection new.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/4/2021 17:09:14'!
test01EncuentraUnaPalabraEnElStackHabiendoUnaPalabra
	|prefixWord|
	stack push: 'Hola'.
	expectedWords add: 'Hola'.
	prefixWord := 'Ho'.
	filteredWords := sentenceFinder find: prefixWord in: stack.
	self assertThat: expectedWords isEqualTo: filteredWords with: [:aWord | (filteredWords removeLast) = aWord].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/4/2021 17:19:18'!
test02EncuentraUnaPalabraEnElStackHabiendoMasDeUnaPalabra
	|prefix|
	stack push: 'Hojalata'.
	stack push: 'Ojota'.
	stack push: 'Ojito'.
	expectedWords add: 'Hojalata'.
	prefix := 'Ho'.
	filteredWords := sentenceFinder find: prefix in: stack.	
	self assertThat: expectedWords isEqualTo: filteredWords with: [:aWord | (filteredWords removeLast) = aWord].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/4/2021 17:28:51'!
test03EncuentraMasDeUnaPalabraEnElStackHabiendoMasDeUnaPalabra
	|prefix |
	stack push: 'Hola'.
	stack push: 'Hoja'.
	stack push: 'a'.
	stack push: 'la'.
	stack push: 'ola'.
	prefix := 'Ho'.
	expectedWords add: 'Hoja'.
	expectedWords add: 'Hola'.
	filteredWords := sentenceFinder find: prefix in: stack.
	self assertThat: expectedWords isEqualTo: filteredWords with: [:aWord | (filteredWords removeLast) = aWord].
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/3/2021 23:36:44'!
test04NoEncuentraUnaPalabraNoHabiendoPalabras
	|prefix|
	prefix := 'Ho'.
	self assert: (sentenceFinder find: prefix in: stack) size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/3/2021 23:38:12'!
test05NoEncuentraUnaPalabraHabiendoUnaPalabra
	|prefix|
	prefix := 'Ho'.
	stack push: 'JoJo'.
	self assert: (sentenceFinder find: prefix in: stack) size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/3/2021 23:42:47'!
test06NoEncuentraUnaPalabraHabiendoMasDeUnaPalabra
	|prefix|
	prefix := 'Ho'.
	stack push: 'JoJo'.
	stack push: 'Koko'.
	stack push: 'ToTo'.
	self assert: (sentenceFinder find: prefix in: stack) size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/4/2021 17:43:35'!
test07AlBuscarUnaPalabraExistenteElStackNoSeModifica
	|prefix stackElements |
	stack push: 'Hola'.
	stack push: 'oja'.
	stack push: 'ja'.
	prefix := 'Ho'.
	stackElements := OrderedCollection new.
	stackElements add: 'Hola'.
	stackElements add: 'oja'.
	stackElements add: 'ja'.	
	sentenceFinder find: prefix in: stack.

	self assertThat: stackElements isEqualTo: stack with: [:aWord| (stack pop) = aWord].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/4/2021 17:43:53'!
test08AlBuscarUnaPalabraInexistenteElStackNoSeModifica
	|prefix stackElements |
	stack push: 'Hola'.
	stack push: 'oja'.
	stack push: 'ja'.
	prefix := 'to'.
	stackElements := OrderedCollection new.
	stackElements add: 'Hola'.
	stackElements add: 'oja'.
	stackElements add: 'ja'.	
	sentenceFinder find: prefix in: stack.

	self assertThat: stackElements isEqualTo: stack with: [:aWord| (stack pop) = aWord].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/4/2021 13:47:49'!
test09SiLePasamosUnPrefijoVacioFalla
	| prefix |
	stack push: 'Hola'.
	stack push: 'oja'.
	stack push: 'ja'.
	prefix := ''.
	self
		should: [ sentenceFinder find: prefix in: stack ]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: SentenceFinderByPrefix emptyPrefixError].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/4/2021 14:39:34'!
test10SiLePasamosUnPrefijoCaracterFalla
	| prefix |
	stack push: 'Hola'.
	stack push: 'oja'.
	stack push: 'ja'.
	prefix := $ .
	self
		should: [ sentenceFinder find: prefix in: stack ]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: SentenceFinderByPrefix invalidPrefixError].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/4/2021 14:46:51'!
test11SiLePasamosUnPrefijoConSoloEspaciosFalla
	| prefix |
	stack push: 'Hola'.
	stack push: 'oja'.
	stack push: 'ja'.
	prefix := ' '.
	self
		should: [ sentenceFinder find: prefix in: stack ]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: SentenceFinderByPrefix prefixContainsAnSpaceError ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'TV 11/4/2021 14:47:03'!
test12SiLePasamosUnPrefijoConEspaciosFalla
	| prefix |
	stack push: 'Hola'.
	stack push: 'oja'.
	stack push: 'ja'.
	prefix := 'Ho la'.
	self
		should: [ sentenceFinder find: prefix in: stack ]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: SentenceFinderByPrefix prefixContainsAnSpaceError ].! !


!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'TV 11/4/2021 17:44:23'!
assertThat: thisCollection isEqualTo: thisOtherCollection with: aBlock
	self assert: (thisOtherCollection size) equals: (thisCollection size).
	self assert: [
			^(thisCollection do: [:anElement | (aBlock value: anElement) ifFalse: [^false]]).
			].! !



!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accesing' stamp: 'TV 11/1/2021 23:46:16'!
size
	^stackElements size.! !

!OOStack methodsFor: 'accesing' stamp: 'TV 11/1/2021 23:46:16'!
top
	^stackElements top.! !


!OOStack methodsFor: 'operations' stamp: 'TV 11/1/2021 23:46:16'!
pop
	|lastElement|
	lastElement := stackElements top.
	stackElements := stackElements pop.
	^lastElement.! !

!OOStack methodsFor: 'operations' stamp: 'TV 11/4/2021 15:06:14'!
push: anElement
	self subclassResponsibility.! !


!OOStack methodsFor: 'testing' stamp: 'TV 11/1/2021 23:46:16'!
isEmpty
	^stackElements size = 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'TV 11/4/2021 15:27:54'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'initialization' stamp: 'TV 11/4/2021 14:57:36'!
with: aMaxSize
	^OOLimitedStack new initializeWith: aMaxSize.! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'maxSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'initialization' stamp: 'TV 11/4/2021 15:27:43'!
initializeWith: aMaxSize
	maxSize := aMaxSize.
	stackElements := NullElement new.! !


!OOLimitedStack methodsFor: 'operations' stamp: 'TV 11/4/2021 15:01:52'!
push: anElement
	(self size = maxSize) ifTrue: [self error: self class maxSizeReachedError].
	stackElements := stackElements push: anElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'error descriptions' stamp: 'TV 11/4/2021 15:01:34'!
maxSizeReachedError
	^'se alcanzó el máximo tamaño admitido'.! !


!classDefinition: #OONotLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OONotLimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONotLimitedStack methodsFor: 'initialization' stamp: 'TV 11/4/2021 15:21:29'!
initialize
	stackElements := NullElement new.! !


!OONotLimitedStack methodsFor: 'operations' stamp: 'TV 11/4/2021 15:09:32'!
push: anElement
	stackElements := stackElements push: anElement.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'TV 11/4/2021 14:49:07'!
removeAllElementsFrom: thisStack 
	|stackElements|
	stackElements := OrderedCollection new.
	(thisStack size) timesRepeat: 
	[
		stackElements add: thisStack pop.
	].
	^stackElements.
	! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'TV 11/4/2021 15:42:13'!
retrieveOriginal: Stack from: thisCollection

	thisCollection reverseDo: [:anElement | Stack push: anElement ].! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'TV 11/4/2021 16:30:40'!
find: thisWord in: thisStack
	|stackElements|
	self verifyValidPrefix: thisWord.
	stackElements := self removeAllElementsFrom: thisStack.
	self retrieveOriginal: thisStack from: stackElements.
	^stackElements select: [:anElement| anElement beginsWith: thisWord].! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'TV 11/4/2021 16:12:42'!
verifyValidPrefix: aWord.

	(aWord = $ ) ifTrue: [self error: self class invalidPrefixError].
	
	(aWord isEmpty) ifTrue: [self error: self class emptyPrefixError ].
	
	(aWord includesSubString: ' ') ifTrue: [self error: self class prefixContainsAnSpaceError ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'TV 11/4/2021 14:37:24'!
emptyPrefixError
	^'empty prefix!!'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'TV 11/4/2021 14:37:20'!
invalidPrefixError
	^'invalid prefix!!'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'TV 11/4/2021 14:33:57'!
prefixContainsAnSpaceError
	^'prefix contains an space!!'.! !


!classDefinition: #StackElements category: 'Stack-Exercise'!
Object subclass: #StackElements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElements methodsFor: 'operations' stamp: 'TV 11/1/2021 20:30:35'!
pop
	self subclassResponsibility.
	! !

!StackElements methodsFor: 'operations' stamp: 'TV 11/4/2021 17:15:28'!
push: anElement
	self subclassResponsibility.
	! !


!StackElements methodsFor: 'testing' stamp: 'TV 11/1/2021 20:30:44'!
isEmpty
	self subclassResponsibility.
	! !


!StackElements methodsFor: 'accesing' stamp: 'TV 11/1/2021 20:33:16'!
size
	self subclassResponsibility.! !

!StackElements methodsFor: 'accesing' stamp: 'TV 11/1/2021 20:30:33'!
top
	self subclassResponsibility.
	! !


!classDefinition: #NotNullElements category: 'Stack-Exercise'!
StackElements subclass: #NotNullElements
	instanceVariableNames: 'collection previousCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotNullElements methodsFor: 'operations' stamp: 'TV 11/1/2021 23:16:52'!
pop
	^previousCollection.! !

!NotNullElements methodsFor: 'operations' stamp: 'TV 11/1/2021 23:23:25'!
push: anElement
	|aCollection|
	aCollection  := OrderedCollection new.
	aCollection addAll: collection.
	aCollection addLast: anElement.
	
	^NotNullElements with: aCollection and: self.! !


!NotNullElements methodsFor: 'testing' stamp: 'TV 11/1/2021 20:26:37'!
isEmpty
	^false.! !


!NotNullElements methodsFor: 'accesing' stamp: 'TV 11/1/2021 20:26:47'!
size
	^collection size.! !

!NotNullElements methodsFor: 'accesing' stamp: 'TV 11/1/2021 20:26:50'!
top
	^collection last.! !


!NotNullElements methodsFor: 'initialization' stamp: 'TV 11/1/2021 23:30:38'!
initializeWith: aCollection and: aPreviousCollection
	collection := aCollection.
	previousCollection := aPreviousCollection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotNullElements class' category: 'Stack-Exercise'!
NotNullElements class
	instanceVariableNames: ''!

!NotNullElements class methodsFor: 'as yet unclassified' stamp: 'TV 11/1/2021 23:30:38'!
with: aCollection and: aPreviousCollection
	
	^self new initializeWith: aCollection and: aPreviousCollection.! !


!classDefinition: #NullElement category: 'Stack-Exercise'!
StackElements subclass: #NullElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullElement methodsFor: 'accesing' stamp: 'TV 11/1/2021 20:27:02'!
size
	^0
	! !

!NullElement methodsFor: 'accesing' stamp: 'TV 11/1/2021 20:27:04'!
top
	self error: OOStack stackEmptyErrorDescription.! !


!NullElement methodsFor: 'operations' stamp: 'TV 11/1/2021 20:26:56'!
pop
	self error: OOStack stackEmptyErrorDescription.! !

!NullElement methodsFor: 'operations' stamp: 'TV 11/1/2021 23:23:25'!
push: anElement
	|aCollection|
	aCollection := OrderedCollection new.
	aCollection add: anElement .
	
	^NotNullElements with: aCollection and: self.! !


!NullElement methodsFor: 'testing' stamp: 'TV 11/1/2021 20:26:52'!
isEmpty
	^true.! !
