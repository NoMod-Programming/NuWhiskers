
!SHA256WithPrimitive methodsFor: 'private' stamp: 'ul 3/6/2008 03:12'!
storeLength: bitLength in: aByteArray
	"Fill in the final 8 bytes of the given ByteArray with a 64-bit big-endian representation of the original message length in bits."

	| n i |
	n := bitLength.
	i := aByteArray size.
	[n > 0] whileTrue: [
		aByteArray at: i put: (n bitAnd: 16rFF).
		n := n bitShift: -8.
		i := i - 1].
! !