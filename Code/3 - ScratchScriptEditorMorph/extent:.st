
!ScratchScriptEditorMorph methodsFor: 'geometry' stamp: 'EMP 7/15/2017 15:42'!
extent: aPoint

	super extent: aPoint.
	viewerPane ifNotNil: [
		pageViewerMorph ifNotNil: [
			currentCategory = 'Scripts' ifTrue: [
				pageViewerMorph extent: self bottomRight - (viewerPane topRight + (4@12))
			] ifFalse: [
				pageViewerMorph extent: self extent - (4@(tabPaneMorph height + 8))
			]
		].
	]! !
