
!ScratchLibraryMorph methodsFor: 'geometry' stamp: 'EMP 7/13/2017 23:09'!
extent: aRectangle

	| nameHeight |
	<pragma: #i18nIssue>
	super extent: aRectangle.
	scrollPane isNil | stagePane isNil ifTrue: [^ self].
	
	nameHeight := ((ScratchFrameMorph getFont: #LibraryItemName) extentOfString: 'Sprite1' localized ) y.
	thumbWidth := 54 + nameHeight.
	itemExtent := thumbWidth@thumbWidth.

	stagePane width: itemExtent x.
	scrollPane left: stagePane right.

	self layoutChanged.
! !
