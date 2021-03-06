
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 7/14/2017 19:30'!
developersMenu: menu
	"Present the Whiskers developer's menu."

	fillScreenFlag
		ifTrue: [
			menu addItem: [:item |
				item
					contents: 'turn fill screen off' localized;
					target: self;
					selector: #fillScreenOff
			]
		] ifFalse: [
			menu addItem: [:item |
				item
					contents: 'turn fill screen on' localized;
					target: self;
					selector: #fillScreenOn
			]
	].
	UseErrorCatcher
		ifTrue: [
			menu addItem: [:item |
				item
					contents: 'turn error catcher off' localized;
					target: self;
					selector: #toggleErrorCatcher
			]
		] ifFalse: [
			menu addItem: [:item |
				item
					contents: 'turn error catcher on' localized;
					target: self;
					selector: #toggleErrorCatcher
			]
	].

	menu addLine.
	menu addItem: [:item |
		item
			contents: 'update version number...' localized;
			target: self;
			selector: #updateVersion.
	].
	menu addLine.

	menu addItem: [:item |
		item
			contents: 'save image for end-user' localized;
			target: self;
			selector: #saveImageForEndUser
	].
! !
