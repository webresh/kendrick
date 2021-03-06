examples
exampleRK4SolverOnSIRSimpleModelWithODERepresentation
	"self new exampleRK4SolverOnSIRSimpleModelWithODERepresentation"
	|model simulator dB |
	model := self modelRK4SolverOnSIRSimpleModelWithODERepresentation.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.3 step: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator allTimeSeries).
	dB xLabel: 'Time (year)'.
	^ dB open