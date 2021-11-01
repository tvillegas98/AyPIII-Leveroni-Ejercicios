!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
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


!classDefinition: #Elements category: 'Stack-Exercise'!
Object subclass: #Elements
	instanceVariableNames: 'collection next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #NotNullElements category: 'Stack-Exercise'!
Elements subclass: #NotNullElements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotNullElements methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 20:01:17'!
initializeWithCollection: aCollection andNext: aNext
	collection := aCollection. 
	next := aNext.! !

!NotNullElements methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:04:53'!
isEmpty
	^false.! !

!NotNullElements methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:05:06'!
pop
	^next.! !

!NotNullElements methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 20:02:13'!
push: anElement
	|aCollection|
	aCollection  := OrderedCollection new.
	aCollection addAll: collection .
	aCollection addLast: anElement .
	
	^NotNullElements with: aCollection andNext: self.! !

!NotNullElements methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:05:28'!
size
	^collection size.! !

!NotNullElements methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:05:19'!
top
	^collection last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotNullElements class' category: 'Stack-Exercise'!
NotNullElements class
	instanceVariableNames: ''!

!NotNullElements class methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 20:01:26'!
with: aCollection andNext: aNext
	
	^self new initializeWithCollection: aCollection andNext: aNext.! !


!classDefinition: #NullElement category: 'Stack-Exercise'!
Elements subclass: #NullElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullElement methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:00:38'!
isEmpty
	^true.! !

!NullElement methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:34:50'!
pop
	self error: OOStack stackEmptyErrorDescription.! !

!NullElement methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 20:00:45'!
push: anElement
	|aCollection|
	aCollection := OrderedCollection new.
	aCollection add: anElement .
	
	^NotNullElements with: aCollection  andNext: self.! !

!NullElement methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 18:59:55'!
size
	^0
	! !

!NullElement methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:35:05'!
top
	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #NameOfSubclass category: 'Stack-Exercise'!
Object subclass: #NameOfSubclass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:38:35'!
initialize
	elements := NullElement new
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 18:18:11'!
isEmpty
	^elements size = 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:45:58'!
pop
	|last|
	last := elements top.
	elements := elements pop.
	^last.
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:40:40'!
push: anElement
	elements := elements push: anElement.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 14:34:01'!
size
	^elements size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FrancoCapra 11/1/2021 19:38:08'!
top
	^elements top.! !

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
