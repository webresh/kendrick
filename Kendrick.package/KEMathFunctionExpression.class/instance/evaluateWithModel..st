evaluating
evaluateWithModel: aModel

| expressionValue |
expressionValue := functionExpr evaluateWithModel: aModel.

(functionName = #sin) ifTrue: [^(expressionValue sin)].
(functionName = #cos) ifTrue: [^(expressionValue cos)].
(functionName = #log) ifTrue: [^(expressionValue log)].
(functionName = #exp) ifTrue: [^(expressionValue exp)]