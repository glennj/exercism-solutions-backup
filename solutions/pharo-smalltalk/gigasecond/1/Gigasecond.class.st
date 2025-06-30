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

	| stream future |
	stream := String new writeStream.
	future := (DateAndTime fromString: aDateTimeString) + 1000000000.

	future printYMDOn: stream.
	stream nextPut: $T.
	future printHMSOn: stream.
	
	^ stream contents.
	
]
