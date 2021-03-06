
!ScratchFrameMorph class methodsFor: 'versioning' stamp: 'EMP 7/16/2017 09:07'!
fileOutChanges
	"ScratchFrameMorph fileOutChanges"
	| allClasses fileoutDir |
	allClasses := ChangeSet current changedClasses.
	fileoutDir := self fileoutDir.

	fileoutDir forceNewFileNamed: 'preamble.st' do: [:preambleStream |
		allClasses do: [:aClass | 
			ChangeSet current
				fileOutClassDefinition: aClass
				on: preambleStream
		]
	].

	allClasses do: [:aClass |
		| currentDir changes |
		changes := Set new.
		currentDir := fileoutDir directoryNamed: (aClass theNonMetaClass allSuperclasses size asString, ' - ',aClass name).
		currentDir assureExistence.
		(ChangeSet current methodChangesAtClass: aClass name) associationsDo:
			[:mAssoc | (mAssoc value = #remove or: [mAssoc value = #addedThenRemoved]) ifFalse: [changes add: mAssoc key]].
		changes do: [:methodName |
			| outStream |
			outStream := WriteStream on: (String new: 100).
			aClass 
				printMethodChunk: methodName
				withPreamble: true
				on: outStream
				moveSource: false
				toFile: 0.
			currentDir 
				forceWriteSourceCodeFrom: outStream
				baseName: (methodName copyReplaceTokens: ':' with: '_')
				isSt: true
				useHtml: false.
		]
	].
	fileoutDir forceNewFileNamed: 'postscript.st' do: [:preambleStream |
		allClasses do: [:aClass | 
			ChangeSet current
				fileOutPSFor: aClass
				on: preambleStream
		].
		ChangeSet current classRemoves asSortedCollection do:
			[: aClassName |
				preambleStream nextChunkPut: 'Smalltalk removeClassNamed: #', aClassName; cr
		].
	].! !
