
!ScratchTranslator class methodsFor: 'language translation' stamp: 'EMP 7/13/2017 19:03'!
checkTranslationDict
	"Do some sanity check on the current translation dictionary."

	| categories allSpecs mathOps |
	TranslationDict size = 0 ifTrue: [^ #()].  "English"

	categories := ScratchViewerMorph categories.
	categories do: [:cat | self assert: [TranslationDict includesKey: cat asString]].

	"make sure all translations have the same number arguments"
	TranslationDict associationsDo: [:assoc |
		self assert: [(self parameterSpecs: assoc key) = (self parameterSpecs: assoc value)]].

	"makes sure there is a translation for every block in every category (except variables)"
	allSpecs := Set new: 100.
	(ScratchSpriteMorph blockSpecs, ScratchStageMorph blockSpecs) do: [:spec |
		(spec isArray) ifTrue: [allSpecs add: spec]].
	allSpecs add: #('else').

	"remove obsolete specs and math operators"
	ScratchSpriteMorph obsoleteBlockSpecs do: [:spec |  "remove obsolete block specs"
		allSpecs remove: spec ifAbsent: []].
	mathOps := ('+-*/<=>' asArray collect: [:ch | '%n ', ch asString, ' %n']) asSet.
	allSpecs := allSpecs select: [:spec | (mathOps includes: spec first) not].

	allSpecs := allSpecs asArray sort: [:s1 :s2 | s1 first < s2 first].
	^ allSpecs select: [:spec | (TranslationDict includesKey: spec first) not]
! !
