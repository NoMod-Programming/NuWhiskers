
!ScratchCategorySelector methodsFor: 'event handling' stamp: 'EMP 7/13/2017 15:22'!
mouseLeave: evt
	textColor := isSelected ifTrue: [Color white] ifFalse: [Color gray].
	self changed! !
