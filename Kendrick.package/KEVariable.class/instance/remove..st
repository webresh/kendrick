removing
remove: aVariable
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"
	self = aVariable ifTrue: [ ^ nil ].
	^ self