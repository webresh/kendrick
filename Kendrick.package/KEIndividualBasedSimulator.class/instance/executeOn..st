as yet unclassified
executeOn: aModel
	| t rand |
	super executeOn: aModel.
	t := tMin.
	self saveCompartmentsValueAtTime: tMin.
	rand := Random new.
	[ t < tMax ]
		whileTrue: [ 
			self doIBMIteration: t random: rand.
			self updateIndividuals.
			t := t + step.
			self saveCompartmentsValueAtTime: t ]