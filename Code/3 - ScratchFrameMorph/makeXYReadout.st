
!ScratchFrameMorph methodsFor: 'intialization' stamp: 'EMP 7/14/2017 12:37'!
makeXYReadout
	"Make and answer an x-y readout."

	| normalFont boldFont panel spaceWidth labelX readoutX labelY readoutY |
	<pragma: #i18nIssue>
	normalFont := (ScratchFrameMorph getFont: #XYReadout).
	boldFont := (ScratchFrameMorph getFont: #XYReadoutBold).

	panel := AlignmentMorph new color: Color transparent.

	ScratchTranslator isRTL
		ifTrue: [labelX := StringMorph new font: boldFont; contents: ':x']
		ifFalse: [labelX := StringMorph new font: boldFont; contents: 'x:'].
	readoutX := UpdatingStringMorph new
		target: self;
		getSelector: #mouseX;
		font: normalFont;
		stepTime: 50;
		growable: false;
		contents:'-1000'.
	"having set the initial contents of the morph, we have established width and now set that as the max allowed"
	readoutX maximumWidth: readoutX width.
	
	ScratchTranslator isRTL
		ifTrue: [labelY := labelX fullCopy contents: ':y']
		ifFalse: [labelY := labelX fullCopy contents: 'y:'].
	readoutY := readoutX fullCopy getSelector: #mouseY.

	spaceWidth := ((readoutX stringWidth: ' ') * 0.8) asInteger.

	ScratchTranslator isRTL
		ifTrue: [readoutY rightJustify: true.
			panel addMorphBack: (readoutY position: 0@0).
			panel addMorphBack: (labelY position: ((readoutY topRight) + (spaceWidth@0))).]
		ifFalse: [panel addMorphBack: (labelX position: 0@0).
			panel addMorphBack: (readoutX position: ((labelX topRight) + (spaceWidth@0)))].

	ScratchTranslator isRTL
		ifTrue: [readoutX rightJustify: true.
			panel addMorphBack: (readoutX position: (labelY right@labelY top) + (spaceWidth@0)).
			panel addMorphBack: (labelX position: ((readoutX topRight) + (spaceWidth@0)))]
		ifFalse: [panel addMorphBack: (labelY position: (labelX right + readoutX width + 8)@(labelX top)).
			panel addMorphBack: (readoutY position: ((labelY topRight) + (spaceWidth@0)))].
	
	ScratchTranslator isRTL
		ifTrue: [panel extent: ((labelX right) max: (labelY right))@(labelY bottom)]
		ifFalse: [panel extent: ((readoutX right) max: (readoutY right))@(labelY bottom)].

	labelX lock.
	labelY lock.
	
	^ panel
! !
