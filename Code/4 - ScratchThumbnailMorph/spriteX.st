
!ScratchThumbnailMorph methodsFor: 'accessing' stamp: 'EMP 7/13/2017 13:54'!
spriteX
	target isScratchSpriteMorph ifTrue: [
		^ 'x: ', target xpos truncated asString
	].
	^ ''! !
