
!ReporterBlockMorph methodsFor: 'layout' stamp: 'EMP 7/14/2017 23:56'!
doBlockLayout
	"Update the positions of my submorphs."

	| mList maxH h x y |
	cachedForm := nil.
	cachedFeedbackForm := nil.

	mList := self nonControlFlowSubmorphs.
	maxH := 0.
	mList do: [:m |
		(m isArgMorph) ifTrue: [m fixArgLayout].
		(m isBlockMorph) ifTrue: [m fullBounds].
		maxH := maxH max: m height].
	h := (maxH + 4) max: 17.

	x := isBoolean ifTrue: [8] ifFalse: [2].
	(mList size > 0 and: [mList first isStringMorph]) ifTrue: [x := x + 4].

	mList do: [:m |
		(m isStringMorph) ifTrue: [m color: self labelColor].
		y := (h - m height) // 2.
		m position: self position + (x@y).
		x := x + m width + 3].
	x := x + (isBoolean ifTrue: [1] ifFalse: [-2]).

	self extent: (x + 4) @ h.
	"(self ownerThatIsA: ScratchBlockPaletteMorph) ifNotNil: [:sbpm| 
		sbpm fixLayout]."
! !
