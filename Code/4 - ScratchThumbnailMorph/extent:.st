
!ScratchThumbnailMorph methodsFor: 'accessing' stamp: 'EMP 7/13/2017 13:58'!
extent: aPoint
"Only use squares"
	self image: (Form extent: 50@50 depth: 16).
	image fillColor: Color transparent.
	image border: image boundingBox width: 1.
	lastUpdateMSecs := -1.
	xreadout position: self topLeft + (5@50).
	yreadout position: self topLeft + (5@65).! !
