as yet unclassified
generateTransitionOfEvents

| listOfNewEvents count |
events := self generateEvents.

	"Finding transition of each event in eventList. Each transition: rate, actions, fromStatus, toStatus. If event has no transition, toStatus: nil"
	listOfNewEvents := Array new: (events size).
	count := 1.
	events do:[:eachEvent|
		|aTransition|
		aTransition := (KETransition new) rate: (eachEvent rate); actions: (eachEvent actions); fromStatus: nil; toStatus: nil; eqIndex: (eachEvent eqIndex); eqIndexVar: (eachEvent eqIndexVar).		
		eachEvent actions keysAndValuesDo:[:status :modification |				
			(modification > 0) ifTrue: [aTransition toStatus: status].
			(modification < 0) ifTrue: [aTransition fromStatus: status].
			].
		listOfNewEvents at: count put: aTransition.
		count := count + 1.
		].
	^listOfNewEvents