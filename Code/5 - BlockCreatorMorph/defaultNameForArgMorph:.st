
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 10:01'!
defaultNameForArgMorph: anArgMorph
	| type others otherLabels newLabel temp |
	type _ anArgMorph type.
	others _ (self submorphs select: [:morph | (morph isKindOf: ColoredExpressionArgMorph) and: [morph type = type]]).
	otherLabels  _ (others collect: [:item | item evaluate third]).
	newLabel _ 1.
	otherLabels do: [:label | ((label beginsWith: (type asString)) and: [label size > (type asString size)]) ifTrue: [((temp _ (label copyFrom: (type asString size + 1) to: (label size))) asNumberNoError = 0) ifFalse: [newLabel _ temp asNumberNoError + 1]]].
^ (type asString), newLabel asString! !