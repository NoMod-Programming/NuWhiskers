
!ScratchFrameMorph class methodsFor: 'versioning' stamp: 'EMP 7/16/2017 09:07'!
fileOutChangesToZip
	"ScratchFrameMorph fileOutChangesToZip"
	| allClasses outArchive |
	outArchive := ZipArchive new.

	allClasses := ChangeSet current changedClasses.

	outArchive addString: (String streamContents: [:preambleStream |
		allClasses do: [:aClass | 
			ChangeSet current
				fileOutClassDefinition: aClass
				on: preambleStream
		]
	])
	as: 'preamble.txt'.

	allClasses do: [:aClass |
		| currentDir changes |
		changes := Set new.
		currentDir := aClass theNonMetaClass allSuperclasses size asString, ' - ',aClass name.
		outArchive addDirectory: currentDir.
		(ChangeSet current methodChangesAtClass: aClass name) associationsDo:
			[:mAssoc | (mAssoc value = #remove or: [mAssoc value = #addedThenRemoved]) ifFalse: [changes add: mAssoc key]].
		changes do: [:methodName |
			outArchive
				addString:
					(String streamContents: [:outStream |
						aClass 
							printMethodChunk: methodName
							withPreamble: true
							on: outStream
							moveSource: false
							toFile: 0.
					])
				as: currentDir, '/' ,(methodName copyReplaceTokens: ':' with: '_'),'.st'.
		]
	].
	outArchive addString: (String streamContents: [:preambleStream |
		allClasses do: [:aClass | 
			ChangeSet current
				fileOutPSFor: aClass
				on: preambleStream
		].
		ChangeSet current classRemoves asSortedCollection do:
			[: aClassName |
				preambleStream nextChunkPut: 'Smalltalk removeClassNamed: #', aClassName; cr
		]
	])
	as: 'postscript.st'.

	outArchive writeToFileNamed: 'Code.zip' prepending: ''.! !
