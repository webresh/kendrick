as yet unclassified
gtInspectorGraphIn: composite
	<gtInspectorPresentationOrder: 30>
	composite roassal2
		title: 'View';
		painting: [ :view|
					|graph lab nodes|
					graph := (KEGraphFromCompartments on: self) run.
					lab := RTLabel new.
					nodes := ((RTEllipse new size: 15; color:((Color blue alpha: 0.4))) + (lab text: [ :e | e model any asString ])) elementsOn: graph nodes.
					nodes @ RTDraggable.
					view addAll: nodes.
					RTEdgeBuilder new view: view;shape: (RTArrowedLine new color: Color black; attachPoint: RTCircleAttachPoint new);source: graph edges connectFrom:#from to:#to.					.
					(RTLayoutBuilder new forceWithCharge: -450) on: view elements.
					view
					]