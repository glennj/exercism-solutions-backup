Extension { #name : #DateAndTime }

{ #category : '*Exercise@Gigasecond' }
DateAndTime >> asStringYMDHMS [
	^ String streamContents: [ :aStream |
		self printYMDOn: aStream.
		aStream nextPut: $T.
		self printYMDOn: aStream.
	 ]
]
