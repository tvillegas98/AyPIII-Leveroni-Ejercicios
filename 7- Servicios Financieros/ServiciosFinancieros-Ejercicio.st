!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/18/2021 21:23:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/18/2021 21:23:51'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/18/2021 21:23:53'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/18/2021 21:23:56'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/18/2021 21:23:59'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/18/2021 21:24:02'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TV 11/18/2021 21:24:04'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
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


!TransferDeposit methodsFor: 'initialization' stamp: 'TV 11/26/2021 01:19:22'!
register: anAmount on: anAccount in: aTransfer
	anAccount register: (Deposit for: anAmount).
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

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'TV 11/26/2021 01:18:29'!
for: anAmount on: anAccount in: aTransfer
	^self new register: anAmount on: anAccount in: aTransfer! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'counterpart operations' stamp: 'TV 11/26/2021 01:24:10'!
legCounterpart
	^transfer transferDeposit.! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'TV 11/26/2021 01:19:12'!
register: anAmount on: anAccount in: aTransfer
	anAccount register: (Withdraw for: anAmount).
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

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'TV 11/26/2021 01:18:43'!
for: anAmount on: anAccount in: aTransfer
	^self new register: anAmount on: anAccount in: aTransfer! !


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


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'TV 11/18/2021 21:23:41'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TV 11/26/2021 01:30:19'!
balance
	| currentBalance |
	currentBalance := 0 * peso.
	^transactions sum: [ :aTransaction | aTransaction affect: currentBalance ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TV 11/18/2021 21:23:24'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TV 11/18/2021 21:23:27'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TV 11/18/2021 21:23:36'!
transactions 

	^ transactions copy! !


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


!Transfer class methodsFor: 'instance creation' stamp: 'TV 11/26/2021 01:14:24'!
from: originAccount to: destinationAccount of: anAmount
	|transferOrigin transferDestination transfer|
	(anAmount < 0) ifTrue: [self error: self errorDescriptionForNegativeAmount].
	
	transfer := self new.
	
	transferOrigin := TransferWithdraw for: anAmount on: originAccount in: transfer.
	transferDestination := TransferDeposit for: anAmount	 on: destinationAccount in: transfer.
	
	^transfer initializeFrom: transferOrigin to: transferDestination of: anAmount.
	! !
