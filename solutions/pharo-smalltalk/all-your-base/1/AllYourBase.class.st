"
I can convert an array of numbers (representing the digits of a number in the ""input base"") to an array of numbers in the ""output base"".
"
Class {
	#name : 'AllYourBase',
	#superclass : 'Object',
	#category : 'Exercise@AllYourBase',
	#package : 'Exercise@AllYourBase'
}

{ #category : 'as yet unclassified' }
AllYourBase >> decimalValue: decimalValue toDigitsOfBase: outputBase [
	
	(decimalValue = 0)
		ifTrue: [ ^ #(0) ]
		ifFalse: [ 
			| digits val |
			digits := OrderedCollection new.
			val := decimalValue.
			
			[ val > 0 ]
				whileTrue: [ 
					digits addFirst: val % outputBase.
					val := val // outputBase ].
				
			^ digits asArray ]
]

{ #category : 'as yet unclassified' }
AllYourBase >> decimalValueOfDigits: digits inBase: inputBase [

	(digits allSatisfy: [ :digit | digit between: 0 and: inputBase - 1 ])
		ifFalse: [ self error: 'all digits must satisfy 0 <= d < input base' ].

	^ digits reduce: [ :dec :digit | dec * inputBase + digit ]
]

{ #category : 'as yet unclassified' }
AllYourBase >> rebaseInputBase: inputBase digits: digits outputBase: outputBase [

	| decimalValue  |
	
	(inputBase < 2) ifTrue: [ self error: 'input base must be >= 2' ].
	(outputBase < 2) ifTrue: [ self error: 'output base must be >= 2' ].

	decimalValue := digits isEmpty
		ifTrue: [0]
		ifFalse: [self decimalValueOfDigits: digits inBase: inputBase].

	^ self decimalValue: decimalValue toDigitsOfBase: outputBase
]
