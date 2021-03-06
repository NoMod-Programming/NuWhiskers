
!ScratchFrameMorph class methodsFor: 'versioning' stamp: 'EMP 7/16/2017 10:36'!
fileInChangesFromDirectory: aFileDirectory
	| foldersInOrder |
	(aFileDirectory fileExists: 'preamble.st') ifTrue: [
		FileStream fileIn: (aFileDirectory fullNameFor: 'preamble.st')
	].
	foldersInOrder := aFileDirectory directoryNames asSortedCollection sortBlock: [:a :b | a asNumberNoError < b asNumberNoError].
	foldersInOrder do: [:folder |
		| codeFiles currentDir |
		currentDir := aFileDirectory directoryNamed: folder.
		codeFiles := currentDir fileNamesMatching: '*.st'.
		codeFiles do: [:file |
			FileStream fileIn: (currentDir fullNameFor: file)
		]
	].
		(aFileDirectory fileExists: 'postscript.st') ifTrue: [
		FileStream fileIn: (aFileDirectory fullNameFor: 'postscript.st')
	].! !
