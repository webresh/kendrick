as yet unclassified
parametersIn: constructor

	"Show the list of parameters with its value"

	constructor table
		display: [ :model | model parameters] ;
		column: 'Name' evaluated: [ :parameter| parameter asString] width:150;
		column: 'Value' evaluated: [ :parameter | parameter asString]";
		selectionAct: [:courbe | courbe selection inspect] on: $v entitled: 'View'"