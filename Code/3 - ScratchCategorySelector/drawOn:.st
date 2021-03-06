
!ScratchCategorySelector methodsFor: 'drawing' stamp: 'EMP 7/13/2017 15:09'!
drawOn: aCanvas
	| tabW colorRect toFillRect |
	tabW := 7.
	colorRect := (self topLeft extent: tabW @ bounds height).
	toFillRect := colorRect topRight extent: (bounds width - tabW) @ bounds height.
	isSelected ifTrue: [
		aCanvas fillRectangle: bounds color: categoryColor.
		^ aCanvas drawString: translatedLabel in: ((colorRect topRight + (2@3)) extent: bounds width - tabW @ bounds height) font: (ScratchFrameMorph getFont: #Category) color: textColor
	].
	aCanvas fillRectangle: colorRect color: categoryColor.
	aCanvas fillRectangle: toFillRect color: color.
	aCanvas drawString: translatedLabel in: ((colorRect topRight + (2@3)) extent: bounds width - tabW @ bounds height) font: (ScratchFrameMorph getFont: #Category) color: textColor! !
