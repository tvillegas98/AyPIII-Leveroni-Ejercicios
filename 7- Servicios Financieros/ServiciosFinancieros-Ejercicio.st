!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'aPortfolio anotherPortfolio anAccount anotherAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:03:26'!
test01WhenAPortfolioIsEmptyHasABalanceOfZeroPesos
	
	self assert: (aPortfolio balance) equals: 0*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:59:48'!
test02AddingAnAccountToAPortfolioModifiesItsBalance

	Deposit register: 100*peso on: anAccount.	
	aPortfolio register: anAccount.
	
	self assert: (aPortfolio balance) equals: 100*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TV 11/29/2021 16:00:35'!
test03AddingMultiplesAccountsToAPortfolioModifiesItsBalance

	Deposit register: 100*peso on: anAccount.
	Deposit register: 200*peso on: anotherAccount.
	
	aPortfolio register: anAccount.
	aPortfolio register: anotherAccount.
	
	self assert: (aPortfolio balance) equals: 300*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TV 11/29/2021 16:02:05'!
test04AddingAPortfolioToAnoterPortfolioModifiesItsBalance
		
	Deposit register: 100*peso on: anAccount.
	Deposit register: 200*peso on:anotherAccount.
	
	aPortfolio register: anAccount.
	anotherPortfolio register: anotherAccount.
	
	aPortfolio register: anotherPortfolio.
	
	self assert: (aPortfolio balance) equals: 300*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TV 11/29/2021 16:02:35'!
test05ThePortfolioKnowsTheTransactionsOfItsElements
	| aDeposit |
	
	aDeposit := Deposit register: 100*peso on: anAccount.
	
	aPortfolio register: anAccount.
	
	self assert: (aPortfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:20:59'!
test06AnEmptyPortfolioDoesntHaveTransactions
	|transactions|

	transactions := aPortfolio transactions.
	
	self assert: (transactions isEmpty).

	! !

!PortfolioTest methodsFor: 'tests' stamp: 'TV 11/29/2021 16:17:44'!
test07APortoflioReturnsAllTransactionsOfItsElements
	|transactions aDeposit anotherDeposit |
	
	aDeposit := Deposit register: 100*peso on: anAccount.
	anotherDeposit := Deposit register: 200*peso on: anotherAccount.
	
	aPortfolio register: anAccount.
	aPortfolio register: anotherAccount.
	
	transactions := aPortfolio transactions.
	
	self assert: transactions includes: aDeposit.
	self assert: transactions includes: anotherDeposit.

	! !


!PortfolioTest methodsFor: 'setUp/tearDown' stamp: 'TV 11/29/2021 15:06:58'!
setUp
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'anAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'setUp/tearDown' stamp: 'TV 11/29/2021 15:47:36'!
setUp
	
	anAccount := ReceptiveAccount new.! !


!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:47:47'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	self assert: 0 equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:48:25'!
test02DepositIncreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: anAccount.
		
	self assert: 100 * peso equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:48:55'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: anAccount.
	Withdraw register: 50 * peso on: anAccount.
		
	self assert: 50 * peso equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:49:10'!
test04WithdrawValueMustBePositive 

	| withdrawValue |

	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: anAccount) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:50:35'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |

	deposit := Deposit register: 100 * peso on: anAccount.
	withdraw := Withdraw register: 50 * peso on: anAccount.
		
	self assert: (anAccount hasRegistered: deposit).
	self assert: (anAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:50:58'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (anAccount hasRegistered: deposit).
	self deny: (anAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/29/2021 15:51:06'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	deposit := Deposit register: 50 * peso on: anAccount.
		
	self assert: 1 equals: anAccount transactions size.
	self assert: (anAccount hasRegistered: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'originAccount destinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'setUp/tearDown' stamp: 'TV 11/26/2021 01:40:00'!
setUp
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.! !


!TransferTest methodsFor: 'tests' stamp: 'TV 11/26/2021 01:40:00'!
test01WhenTransferringACertainAmountItAffectsTheBalanceOfTheReceptiveAccounts

	Transfer from: originAccount to: destinationAccount of: 5*peso.
	
	self assert: 	(originAccount balance) equals: -5*peso.
	self assert: (destinationAccount balance) equals: 5*peso.! !

!TransferTest methodsFor: 'tests' stamp: 'TV 11/26/2021 01:40:00'!
test02WhenTransferringANegativeAmountResultsInAnError

	self
		should: [Transfer from: originAccount to: destinationAccount of: -5*peso.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: Transfer errorDescriptionForNegativeAmount ].
! !

!TransferTest methodsFor: 'tests' stamp: 'TV 11/26/2021 01:40:00'!
test03WhenTransferringACertainAmountWeCanSeeTheTransferredAmount
	
	| transfer |
	transfer := Transfer from: originAccount to: destinationAccount of: 5*peso.
	
	self assert: (transfer transferAmount) equals: 5*peso.! !

!TransferTest methodsFor: 'tests' stamp: 'TV 11/26/2021 01:40:00'!
test04WhenTransferringACertainAmountEachLegOfTheTransferKnowsItsCounterpart
	| transfer transferDepositLeg transferWithdrawLeg |

	transfer := Transfer from: originAccount to: destinationAccount of: 5*peso.
	
	transferDepositLeg := transfer transferDeposit.
	transferWithdrawLeg := transfer transferWithdraw.
	
	self assert: transferDepositLeg legCounterpart equals: transferWithdrawLeg.
	self assert: transferWithdrawLeg legCounterpart equals: transferDepositLeg.
	
	
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'TV 11/26/2021 01:31:46'!
affect: aBalance
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'TV 11/18/2021 21:22:52'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'TV 11/18/2021 21:26:07'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'TV 11/29/2021 15:44:13'!
register: anAmount on: anAccount of: aTransfer
	|transaction|
	
	transaction := self for: anAmount of: aTransfer.
	anAccount register: transaction.
	
	^transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'TV 11/18/2021 21:22:58'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'TV 11/26/2021 01:32:32'!
affect: aBalance
	^aBalance + self value.! !

!Deposit methodsFor: 'value' stamp: 'TV 11/18/2021 21:23:01'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'TV 11/18/2021 21:26:18'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'counterpart operations' stamp: 'TV 11/26/2021 01:24:23'!
legCounterpart
	^transfer transferWithdraw.! !


!TransferDeposit methodsFor: 'initialization' stamp: 'TV 11/29/2021 15:43:38'!
initializeFor: anAmount of: aTransfer
	value := anAmount.
	transfer := aTransfer! !


!TransferDeposit methodsFor: 'value' stamp: 'TV 11/26/2021 01:32:41'!
affect: aBalance
	^aBalance + self value.! !

!TransferDeposit methodsFor: 'value' stamp: 'TV 11/26/2021 01:32:49'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'TV 11/29/2021 15:43:57'!
for: anAmount of: aTransfer
	^self new initializeFor: anAmount of: aTransfer! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'counterpart operations' stamp: 'TV 11/26/2021 01:24:10'!
legCounterpart
	^transfer transferDeposit.! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'TV 11/29/2021 15:43:38'!
initializeFor: anAmount of: aTransfer
	value := anAmount.
	transfer := aTransfer! !


!TransferWithdraw methodsFor: 'value' stamp: 'TV 11/26/2021 01:32:58'!
affect: aBalance
	^aBalance - self value.! !

!TransferWithdraw methodsFor: 'value' stamp: 'TV 11/26/2021 01:33:04'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'TV 11/29/2021 15:44:05'!
for: anAmount of: aTransfer
	^self new initializeFor: anAmount of: aTransfer! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'TV 11/18/2021 21:23:14'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'TV 11/26/2021 01:33:18'!
affect: aBalance
	^aBalance - self value.! !

!Withdraw methodsFor: 'value' stamp: 'TV 11/18/2021 21:46:02'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'TV 11/18/2021 21:26:22'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'portfolioElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'TV 11/29/2021 16:10:33'!
balance
	^self calculateBalance.! !

!Portfolio methodsFor: 'main protocol' stamp: 'TV 11/29/2021 16:12:37'!
hasRegistered: aTransaction
	^portfolioElements anySatisfy: [:aPortfolioElement | aPortfolioElement hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'main protocol' stamp: 'TV 11/29/2021 16:11:23'!
register: aPortfolioElement
	portfolioElements add: aPortfolioElement.! !

!Portfolio methodsFor: 'main protocol' stamp: 'TV 11/29/2021 16:11:28'!
transactions

	|currentTransactions|
	currentTransactions := OrderedCollection new.
	
	portfolioElements do: [:aPortfolioElement | currentTransactions addAllLast: (aPortfolioElement transactions)].
	
	^currentTransactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'TV 11/28/2021 23:08:09'!
initialize
	portfolioElements := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol private' stamp: 'TV 11/29/2021 16:10:22'!
calculateBalance
	^portfolioElements sum: [ :aPortfolioElement | aPortfolioElement balance ] ifEmpty: [ 0 ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'TV 11/28/2021 22:45:23'!
errorDescriptionDuplicateAccounts
	^'No se puede agregar dos veces la misma cuenta'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'TV 11/18/2021 21:23:41'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol - private' stamp: 'TV 11/29/2021 16:13:45'!
calculateBalance
	| currentBalance |
	currentBalance := 0 * peso.
	^transactions sum: [ :aTransaction | aTransaction affect: currentBalance ] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TV 11/29/2021 16:13:40'!
balance
	| currentBalance |
	currentBalance := 0 * peso.
	^transactions sum: [ :aTransaction | aTransaction affect: currentBalance ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TV 11/29/2021 16:16:11'!
hasRegistered: aTransaction

	^transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TV 11/18/2021 21:23:27'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TV 11/29/2021 16:16:37'!
transactions
	^transactions copy.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'transferDeposit transferWithdraw transferAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'main protocol' stamp: 'TV 11/26/2021 00:53:53'!
transferAmount
	^transferAmount! !

!Transfer methodsFor: 'main protocol' stamp: 'TV 11/26/2021 01:23:34'!
transferDeposit
	^transferDeposit! !

!Transfer methodsFor: 'main protocol' stamp: 'TV 11/26/2021 01:23:40'!
transferWithdraw
	^transferWithdraw! !


!Transfer methodsFor: 'initialization' stamp: 'TV 11/26/2021 01:22:52'!
initializeFrom: aTransferOrigin to: aTransferDestination of: anAmount 
	transferWithdraw := aTransferOrigin.
	transferDeposit := aTransferDestination.
	transferAmount := anAmount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'error descriptions' stamp: 'TV 11/26/2021 01:28:17'!
errorDescriptionForNegativeAmount
	^'Cannot withdraw a negative amount'! !


!Transfer class methodsFor: 'instance creation' stamp: 'TV 11/29/2021 15:28:12'!
from: originAccount to: destinationAccount of: anAmount
	|transferOrigin transferDestination transfer|
	(anAmount < 0) ifTrue: [self error: self errorDescriptionForNegativeAmount].
	
	transfer := self new.
	
	transferOrigin := TransferWithdraw register: anAmount on: originAccount of: transfer.
	transferDestination := TransferDeposit register: anAmount	 on: destinationAccount of: transfer.
	
	^transfer initializeFrom: transferOrigin to: transferDestination of: anAmount.
	! !
