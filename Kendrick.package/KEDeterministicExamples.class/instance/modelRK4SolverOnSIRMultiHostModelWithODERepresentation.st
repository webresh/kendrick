examples
modelRK4SolverOnSIRMultiHostModelWithODERepresentation
	"self new exampleRK4SolverOnSIRMultiHostModelWithODERepresentation"
	| model  multiHostConcern|
	multiHostConcern := KEModelPart new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#mosquito #reservoir1 #reservoir2).
	model := KEModel new.
	model population: (KEPopulation size: 13000).
	model attributes: {(#status -> #(#S #I #R))}.
	model addParameter: #mu value: 12.17.
	model addParameter: #gamma value: 52.
	model addParameter: #beta value: 1.
	model addParameter: #lambda value: [ :aModel| 
		(aModel atParameter: #beta) * 
		(aModel atCompartment: {#status->#I}) ].
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S'.
	model addEquation: ('I:t=beta*S*I-(mu+gamma)*I').
	model addEquation: ('R:t=gamma*I-mu*R').
	
	model integrate: multiHostConcern.	
	model 
		atParameter: #mu
		assignValue: 
		[ :aModel| |c val| 
			c := aModel currentCompartment at: #species.
			c = #mosquito ifTrue: [ val := 12.17 ].
			c = #reservoir1 ifTrue: [ val := 0.05 ].
			c = #reservoir2 ifTrue: [ val := 0.05 ].
			val
		].
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #species.
		aModel sizeOfPopulation: c
		].
	model addParameter: #rho value: [ :aModel| |c val|
		c := aModel currentCompartment at: #species.
		c = #mosquito ifTrue: [ val := #(0 0.02 0.02) ].
		c = #reservoir1 ifTrue: [ val := #(0.02 0 0) ].
		c = #reservoir2 ifTrue: [ val := #(0.02 0 0) ].
		val
		].
	model atParameter: #lambda assignValue: [ :aModel|
		((aModel atParameter: #beta) * 
		(aModel atParameter: #rho) * 
		(aModel atCompartment: {#status->#I})) sum
		].
	model atCompartment: { #status->#S. #species->#mosquito } put: 9999.
	model atCompartment: { #status->#I. #species->#mosquito } put: 1.
	model atCompartment: { #status->#R. #species->#mosquito } put: 0.
	model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
	model atCompartment: { #status->#I. #species->#reservoir1 } put: 0.
	model atCompartment: { #status->#R. #species->#reservoir1 } put: 0.
	model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000.
	model atCompartment: { #status->#I. #species->#reservoir2 } put: 0.
	model atCompartment: { #status->#R. #species->#reservoir2 } put: 0.
	^ model