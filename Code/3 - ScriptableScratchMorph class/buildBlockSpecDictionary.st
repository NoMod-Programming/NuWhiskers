
!ScriptableScratchMorph class methodsFor: 'block specs' stamp: 'EMP 7/13/2017 18:41'!
buildBlockSpecDictionary
	"self buildBlockSpecDictionary"

	| blockColor sel |
	BlockSpecDict := IdentityDictionary new: 250.
	BlockColorDict := IdentityDictionary new: 250.

	self withAllSubclassesDo: [:cl |
		blockColor := Color blue.
		cl blockSpecs do: [:spec |
			((spec isString) and: [spec size > 1]) ifTrue: [
				"set color  for this category"
				blockColor := ScratchViewerMorph colorForCategory: spec].
			(spec isMemberOf: Array) ifTrue: [
				sel := spec at: 3.
				BlockSpecDict at: sel put: spec.
				BlockColorDict at: sel put: blockColor]]].
! !
