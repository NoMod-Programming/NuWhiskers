
!ScratchFrameMorph methodsFor: 'intialization' stamp: 'EMP 7/14/2017 13:00'!
initialize

	super initialize.
	fillScreenFlag := false.
	paintingInProgress := false.
	projectInfo := Dictionary new.
	watcherPositions := Dictionary new.
	self projectModified.
	author := ''.
	loginName := ''.
	loginPassword := ''.
	self setNormalViewMode.

	self createBasicPanes.
	self createLogo.
	self createMenuPanel.
	self createStageButtonsPanel.
	self createToolbar.

	self extent: self class defaultExtent
! !
