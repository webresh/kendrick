as yet unclassified
testKEBinaryExpressionWithParentheses
	| input result visitor |
	input := ('S:t=beta*(S+I)' parseAsAnEquation) expression. 
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(9999); numberOfSpecies: 1).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(1); numberOfSpecies: 1).
	visitor visitNode: (KEParameter new symbol: #beta; value: 0.0052).
	result := visitor visitNode: input.

	self assert: result contents = '(beta*(x(0, 0)+x(1, 0)))'.
	