
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 7/12/2017 23:41'!
saveImageForEndUser

	(self confirm: '
Close non-Scratch windows and save this
image in end-user (fillScreen) mode?') ifFalse: [^ self].

	ScratchFrameMorph isXO ifTrue: [Preferences useLargeFonts].

	self setLanguage: 'en'.
	World submorphs do: [:m |
		(m isKindOf: SystemWindow) ifTrue: [m delete]].
	self clearStage.

	Display newDepth: 32.
	HostWindowProxy new onDisplay windowSize: 1024@768.
	self fillScreenOn.
	World doOneCycleNow.
	Smalltalk snapshot: true andQuit: true.
	self startup
! !
