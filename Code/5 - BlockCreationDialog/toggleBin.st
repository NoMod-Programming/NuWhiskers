
!BlockCreationDialog methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 22:28'!
toggleBin
	showingBin ifTrue: [
	mainColumn submorphsDo: [:m | 
		((m = messageLineMorphs) not) ifTrue: [m delete]].
	mainColumn
		addMorphBack: (Morph new extent: (5@6); color: Color transparent);
		addMorphBack: blockColumn;
		addMorphBack: (Morph new extent: (5@6); color: Color transparent);
		addMorphBack: showHideButton;
		addMorphBack: (Morph new extent: (216@7); color: Color transparent);
		addMorphBack: buttonRow] ifFalse: [
	mainColumn submorphsDo: [:m | 
		((m = messageLineMorphs) not) ifTrue: [m delete]].
	mainColumn
		addMorphBack: (Morph new extent: (5@6); color: Color transparent);
		addMorphBack: blockColumn;
		addMorphBack: (Morph new extent: (5@6); color: Color transparent);
		addMorphBack: showHideButton;
		addMorphBack: (Morph new extent: (5@7); color: Color transparent);
		addMorphBack: bin;
		addMorphBack: (Morph new extent: (216@7); color: Color transparent);
		addMorphBack: buttonRow].
	showingBin := showingBin not.
	showingBin ifFalse: [
	World doOneCycleNoInput].
	self extent: ((block width + 60 max: 385) @ (showingBin ifTrue: [mainColumn height + bin height + buttonRow height] ifFalse: [bin height + buttonRow height])).! !
