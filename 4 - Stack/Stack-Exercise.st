!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'TV 11/1/2021 21:03:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/1/2021 21:03:22'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TV 11/1/2021 21:05:36'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'TV 11/1/2021 23:46:16'!
initialize
	stackElements := NullElement new
	! !


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

!OOStack methodsFor: 'operations' stamp: 'TV 11/1/2021 23:46:16'!
push: anElement
	stackElements := stackElements push: anElement.! !


!OOStack methodsFor: 'testing' stamp: 'TV 11/1/2021 23:46:16'!
isEmpty
	^stackElements size = 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackElements category: 'Stack-Exercise'!
Object subclass: #StackElements
	instanceVariableNames: 'collection previousCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElements methodsFor: 'operations' stamp: 'TV 11/1/2021 20:30:35'!
pop
	self subclassResponsibility.
	! !

!StackElements methodsFor: 'operations' stamp: 'TV 11/1/2021 20:30:36'!
push
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
	instanceVariableNames: ''
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
