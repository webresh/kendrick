accessing
executeOn: model times: times
	(from at: #status) = #empty
		ifFalse: [ | old new |
			old := model population compartments at: from.
			new := old - times.
			new := new max: 0.
			model population compartments at: from put: new ].
	(to at: #status) = #empty
		ifFalse: [ | old new |
			old := model population compartments at: to.
			new := old + times.
			model population compartments at: to put: new ]