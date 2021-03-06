as yet unclassified
testSIRModelWithDemography
	| model result visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #N put: 100000.
	model addEquation: ('S:t= mu*N-beta*S*I-mu*S').
	model addEquation: ('I:t=beta*S*I-gamma*I-mu*I').
	model addEquation: ('R:t=gamma*I-mu*R').
	result := model runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.001.
	visitor := KECPPDeterministicVisitor new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 3.
	self assert: (visitor parameters size) = 4.