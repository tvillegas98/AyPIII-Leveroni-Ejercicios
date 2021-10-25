!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:15:45'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:15:49'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:15:51'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:15:55'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:15:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:15:59'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:02'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:06'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:13'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:15'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:18'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:23'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:26'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:29'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:31'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:34'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:40'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:44'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:52'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:54'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:16:56'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:00'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:03'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:05'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:09'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:13'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:15'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:17'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:21'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/24/2021 01:14:26'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: (threeHalfs - oneHalf) equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:28'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:30'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:33'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:36'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:39'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:43'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:46'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:50'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:53'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:17:58'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'TV 10/21/2021 19:18:01'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'CapraFranco 10/25/2021 00:09:26'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'TV 10/21/2021 19:11:54'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'TV 10/21/2021 19:11:57'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'TV 10/21/2021 19:12:00'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'TV 10/21/2021 19:12:02'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'TV 10/21/2021 19:12:04'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'TV 10/21/2021 19:12:07'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'TV 10/21/2021 19:12:10'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'TV 10/21/2021 19:12:15'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'TV 10/21/2021 19:12:18'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'CapraFranco 10/24/2021 19:44:34'!
* aMultiplier 
	
	^aMultiplier beMultipliedToAnEntero: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CapraFranco 10/24/2021 19:37:46'!
+ anAdder
	
	^anAdder beAddedToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CapraFranco 10/24/2021 19:53:42'!
- aSubtrahend 
	
	^aSubtrahend beSubtractedToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CapraFranco 10/24/2021 20:06:09'!
/ aDivisor 
	
	^aDivisor beDividedToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CapraFranco 10/25/2021 00:54:30'!
fibonacci

	self subclassResponsibility .
		! !


!Entero methodsFor: 'comparing' stamp: 'TV 10/21/2021 19:12:38'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'TV 10/21/2021 19:12:41'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'TV 10/21/2021 19:12:44'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'TV 10/21/2021 19:12:48'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'TV 10/21/2021 19:12:51'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'TV 10/21/2021 19:12:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'TV 10/21/2021 19:12:58'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'TV 10/21/2021 19:13:00'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/25/2021 01:55:20'!
// aDivisor 
	
	^Entero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TV 10/24/2021 01:47:20'!
beAddedToAnEntero: anAugend
	^Entero with: anAugend integerValue + self integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 19:36:09'!
beAddedToAnFraccion: anAugend
	
		^Fraccion with: ((anAugend numerator) + (self value * (anAugend denominator))) over: (anAugend denominator).! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 20:04:27'!
beDividedToAnEntero: aDividend
	^Fraccion with: aDividend over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 20:19:35'!
beDividedToAnFraccion: aDividend
	^Fraccion with:(aDividend numerator ) over: (self * aDividend denominator).
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/25/2021 01:56:41'!
beMultipliedToAnEntero: aMultiplicand
	^Entero with: aMultiplicand integerValue * self integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 19:46:56'!
beMultipliedToAnFraccion: aMultiplicand
	^(self * aMultiplicand numerator) / aMultiplicand denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/25/2021 01:56:50'!
beSubtractedToAnEntero: aMinuend
	^Entero with: aMinuend integerValue - self integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 19:57:45'!
beSubtractedToAnFraccion: aMinuend
	^aMinuend numerator - (self * aMinuend denominator) / aMinuend denominator! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/25/2021 01:54:27'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'TV 10/21/2021 19:42:16'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'CapraFranco 10/25/2021 01:57:36'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^((self subclasses) detect: [ :subclass | subclass isAValue: aValue]) new initalizeWith: aValue.! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/25/2021 00:50:51'!
fibonacci
	^Entero with: 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/25/2021 01:05:28'!
isAValue: aValue
	^ aValue = 0! !


!classDefinition: #MayorAUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #MayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!MayorAUno methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/25/2021 01:02:15'!
fibonacci
	^ (self - (Entero with: 1)) fibonacci + (self - (Entero with: 2)) fibonacci! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MayorAUno class' category: 'Numeros-Parte2-Ejercicio'!
MayorAUno class
	instanceVariableNames: ''!

!MayorAUno class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/25/2021 01:05:45'!
isAValue: aValue
	^ aValue > 1! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/25/2021 00:39:26'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/25/2021 01:05:58'!
isAValue: aValue
	^ aValue < 0! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/25/2021 00:40:36'!
fibonacci
	^Entero with: 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'as yet unclassified' stamp: 'CapraFranco 10/25/2021 01:06:09'!
isAValue: aValue
	^ aValue = 1! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CapraFranco 10/24/2021 19:48:49'!
* aMultiplier 
	
	^aMultiplier beMultipliedToAnFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CapraFranco 10/24/2021 19:37:14'!
+ anAdder 
	^anAdder beAddedToAnFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CapraFranco 10/24/2021 19:59:47'!
- aSubtrahend 
	^ aSubtrahend beSubtractedToAnFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CapraFranco 10/24/2021 20:08:24'!
/ aDivisor 
	
	^aDivisor beDividedToAnFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'TV 10/21/2021 19:14:46'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'TV 10/21/2021 19:14:48'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'TV 10/21/2021 19:14:51'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'TV 10/21/2021 19:14:54'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'TV 10/21/2021 19:14:57'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'TV 10/21/2021 19:15:05'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'TV 10/21/2021 19:15:09'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'TV 10/21/2021 19:15:11'!
isZero
	
	^false! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'TV 10/24/2021 01:45:57'!
beAddedToAnEntero: anAugend
	^self class
		with: (self denominator * anAugend) + self numerator
		over: self denominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 19:31:00'!
beAddedToAnFraccion: anAugend
	^numerator * (anAugend denominator) + (denominator * anAugend numerator) / (denominator * anAugend denominator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 20:05:43'!
beDividedToAnEntero: aDividend
	^Fraccion with: (aDividend * self denominator) over: self numerator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 20:08:00'!
beDividedToAnFraccion: aDividend
	^self class 
			with:(self denominator * aDividend numerator) 
			over:(self numerator * aDividend denominator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 19:43:44'!
beMultipliedToAnEntero: aMultiplicand
	^self class with: (self numerator * aMultiplicand) over: self denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 19:48:06'!
beMultipliedToAnFraccion: aMultiplicand
	^(numerator * aMultiplicand numerator) / (denominator * aMultiplicand denominator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 19:53:05'!
beSubtractedToAnEntero: aMinuend
	^aMinuend * self denominator - self numerator / self denominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'CapraFranco 10/24/2021 20:01:50'!
beSubtractedToAnFraccion: aMinuend
	^self class 
		with: (aMinuend numerator * self denominator) - (self numerator * aMinuend denominator)
		over: aMinuend denominator * self denominator.
		! !


!Fraccion methodsFor: 'printing' stamp: 'TV 10/21/2021 19:15:15'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'CapraFranco 10/25/2021 00:26:13'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
