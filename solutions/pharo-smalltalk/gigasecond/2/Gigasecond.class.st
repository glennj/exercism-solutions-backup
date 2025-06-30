"
Class Gigasecond
I can add one billion seconds to a datetime.
"
Class {
	#name : 'Gigasecond',
	#superclass : 'Object',
	#category : 'Exercise@Gigasecond',
	#package : 'Exercise@Gigasecond'
}

{ #category : 'adding' }
Gigasecond >> addMoment: aDateTimeString [

	| stream gigasecond future |
	stream := String new writeStream.
	gigasecond := Duration seconds: 1000000000.
	future := (DateAndTime fromString: aDateTimeString) + gigasecond.

	future printYMDOn: stream.
	stream nextPut: $T.
	future printHMSOn: stream.
	
	^ stream contents.
	
]
