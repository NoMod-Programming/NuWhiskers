
!ScratchScrollBar methodsFor: 'initialization' stamp: 'EMP 7/15/2017 15:45'!
vFrameForm: frameForm sliderForm: sliderForm
	"Initialize myself as a vertical slider, setting my forms by cutting up the given forms.
	We magnify the frameMiddleForm by 100 to make a decent sized form that will require less bitBlt calls"

	| midY w |
	"set my forms"
	midY := frameForm height // 2.
	w := frameForm width.
	frameStartForm := frameForm copy: (0@0 extent: w@midY).
	frameMiddleForm := frameForm copy: (0@midY extent: w@1).
	frameMiddleForm := frameMiddleForm magnify: frameMiddleForm boundingBox by: 1@100.
	frameEndForm := frameForm copy: (0@(midY + 1) corner: frameForm extent).

	w := sliderForm width.
	sliderStartForm := sliderForm copy: (0@0 extent: w@7).
	sliderMiddleForm := sliderForm copy: (0@(7) extent: w@1).
	sliderEndForm := sliderForm copy: (0@(11) corner: sliderForm extent).

	sliderInsets :=0@0 corner: 0@0.
	self extent: frameStartForm width @ 200.
! !
