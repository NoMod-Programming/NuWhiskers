
!RandomGenerator class methodsFor: 'create' stamp: 'cmm 5/4/2006 00:06'!
fromUser
	"Ask the user to type a long random string and use the result to seed the secure random number generator."

	| string |
	string := FillInTheBlank request: 'Enter a long random string to seed the random generator.'.
	^ self key: string! !
