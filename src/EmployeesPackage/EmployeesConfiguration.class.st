Class {
	#name : 'EmployeesConfiguration',
	#superclass : 'SpMorphicConfiguration',
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'configuring' }
EmployeesConfiguration >> configure: anApplication [

	super configure: anApplication.
	self addStyleSheetFromString: self customStyleSheet
]

{ #category : 'as yet unclassified' }
EmployeesConfiguration >> customStyleSheet [

	^ '
	.application [
		.buttonStyle [ Geometry { #width: 180, #height: 40 } ],
		.buttonGreenStyle [ Draw { #backgroundColor: #8BA385}, Geometry { #width: 180, #height: 40 } ],
		.goButtonStyle [ Draw { #backgroundColor: #ECE38C}, Geometry { #width: 100, #height: 30 } ],
		.addButtonGreenStyle [ Draw { #backgroundColor: #CDD7CB}, Geometry { #width: 60, #height: 60 }],
		.addButtonYellowStyle [ Draw { #backgroundColor: #fffacd}, Geometry { #width: 30, #height: 30 }],
		.cellStyle [ Geometry { #width: 80, #height: 80 }, Font { #size: 20, #bold: true}],
		.green [ Draw { #backgroundColor: #CDD7CB}, Geometry { #width: 320, #height: 240 }],
		.red [ Draw { #color: #red}],
		.yellow [ Draw { #backgroundColor: #fffacd}, Geometry { #width: 180, #height: 100 }],
		.photo [ Geometry { #width: 70, #height: 100 }],
		.list [ Container { #borderColor: #8BA385, #borderWidth: 1, #padding: 3 }, Geometry { #width: 190 }] ,
		.white [ Draw { #backgroundColor: #white} ],
		.lightGray [ Draw { #backgroundColor: #d7d7d7}, Geometry { #height: 35 } ],
		.lightGreen [ Draw { #backgroundColor: #778D45 } ],
		.lightRed [ Draw { #backgroundColor: #FA8072 } ],
		.lightPurple [ Draw { #backgroundColor: #7B68EE } ],
		.title [ Font { #size: 72, #bold: true},
			Geometry { #height: Reset, #width: Reset } ]],
	   .smallTitle [ Font { #bold: true},
			Geometry { #height: Reset, #width: Reset } ]],
	   .h4 [ Font { #size: 14}],
	   .p [ Font { #size: 12}]
'
]
