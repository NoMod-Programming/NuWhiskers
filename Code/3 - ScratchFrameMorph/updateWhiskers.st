
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 7/16/2017 09:54'!
updateWhiskers

	| result |
	result := ScratchFileChooserDialog
		chooseExistingFileType: #update
		extensions: #(zip upd)
		title: 'Choose Version File'.

	result = #cancelled ifTrue: [^ self].

	self class fileInChangesFromZip: (ZipArchive new readFrom: result)! !
