examples
exampleIBMSimulatorOnSIREbolaModel
	"self new exampleIBMSimulatorOnSIREbolaModel"
	|model simulator db spatialConcern countries|
	spatialConcern := KEModelPart new.
	spatialConcern addAttribute: #country value: #(#Liberia #Guinea #SierraLeone #Nigeria #Senegal #Niger).
	spatialConcern addParameter: #rho.
	countries := spatialConcern atAttribute: #country.
	1 to: 5 do: [ :i| 
		(i+1) to: 6 do: [ :j| 
			spatialConcern 
				addTransitionFrom: { #country->(countries at: i) } 
				to: { #country->(countries at: j) } 
				probability: [ :aModel| aModel atParameter: #rho ].
			spatialConcern 
				addTransitionFrom: { #country->(countries at: j) } 
				to: { #country->(countries at: i) } 
				probability: [ :aModel| aModel atParameter: #rho ]
			].
		]. 
	
	model := KEModel new.
	model population: (KEPopulation size: 6000).
	model addAttribute: #status value: #(S I R).
	model addParameter: #gamma value: 0.1.
	model addParameter: #beta value: 0.0002.
	model addParameter: #lambda value: [ :aModel| 
		(aModel atParameter: #beta) *
		(aModel atCompartment: {#status->#I})
		]. 
	model addEquation: ('S:t=-lambda*S').
	model addEquation: ('I:t=lambda*S-gamma*I').
	model addEquation: ('R:t=gamma*I').
	
	model integrate: spatialConcern.
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #country.
		aModel sizeOfPopulation: c
		].
	model atParameter: #lambda assignValue: [ :aModel|
		|c|
		c := aModel currentCompartment at: #country.
		(aModel atParameter: #beta) *
		(aModel atCompartment: {#status->#I. #country->c})
		 ].
	model atParameter: #rho assignValue: 0.05.
	model atCompartment: { #status->#I. #country->#Liberia } put: 50 atOthersPut: 0.
	countries do: [ :each| 
		each = #Liberia 
		ifTrue: [ model atCompartment: { #status->#S. #country->#Liberia } put: 950 ]
		ifFalse: [model atCompartment: { #status->#S. #country->each } put: 1000 ]
	].
	
	simulator := KESimulator new: #IBM from: 0.0 to: 100 step: 0.1.
	simulator executeOn: model.
	"(simulator timeSeriesAt: '{#status: #I, #country: #Guinea}') first save: 'I_Guinea_Det.txt'.
	(simulator timeSeriesAt: '{#status: #I, #country: #Liberia}') first save: 'I_Liberia_Det.txt'.
	(simulator timeSeriesAt: '{#status: #I, #country: #Niger}') first save: 'I_Niger_Det.txt'.
	(simulator timeSeriesAt: '{#status: #I, #country: #Nigeria}') first save: 'I_Nigeria_Det.txt'.
	(simulator timeSeriesAt: '{#status: #I, #country: #Senegal}') first save: 'I_Senegal_Det.txt'.
	(simulator timeSeriesAt: '{#status: #I, #country: #SierraLeone}') first save: 'I_SierraLeone_Det.txt'."
	db := (KEDiagramBuilder new) data: (simulator timeSeriesAt: '{#status: #	I}').
	db open.
	db openMap: #africa 
	   countries: (model atAttribute: #country) 
	   coloredBy: #peakOfEpidemic.
	
	