Class {
	#name : 'AddEmployeeWindowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'id',
		'employee',
		'manager',
		'programmer',
		'saveBtn',
		'surname',
		'experience',
		'hourlyRate',
		'minimumHours',
		'additionalLabel',
		'additionalInput',
		'errorLabel'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'initialization' }
AddEmployeeWindowPresenter >> connectPresenters [

	manager whenActivatedDo: [
		additionalLabel label: 'Підлеглі: '.
		self defaultLayout ].
	programmer whenActivatedDo: [
		additionalLabel label: 'Відпрацьовано годин: '.
		self defaultLayout ].
	saveBtn action: [
		(surname text isNotEmpty and: [
			 experience text isNotEmpty and: [
				 hourlyRate text isNotEmpty and: [ minimumHours text isNotEmpty ] ] ])
			ifTrue: [
				manager state
					ifTrue: [
						employee := Manager new.
						employee := employee
							            surname: surname text;
							            experience: (experience text) asInteger;
							            hourlyRate: (hourlyRate text) asInteger;
							            minimumHours: (minimumHours text) asInteger;
							            companyId: id;
							            subordinates: (additionalInput text) asInteger ]
					ifFalse: [
						employee := Programmer new.
						employee := employee
							            surname: surname text;
							            experience: (experience text) asInteger;
							            hourlyRate: (hourlyRate text) asInteger;
							            minimumHours: (minimumHours text) asInteger;
							            companyId: id;
							            actualHours: (additionalInput text) asInteger ].
				self window close ]
			ifFalse: [
				errorLabel
					label: 'Заповніть усі необхідні поля';
					show ] ]
]

{ #category : 'layout' }
AddEmployeeWindowPresenter >> defaultLayout [

	| tmp1 tmp2 tmp3 tmp5 |
	tmp1 := SpBoxLayout newVertical.
	tmp1 vAlignCenter.
	tmp2 := SpGridLayout new.
	tmp2
		add: 'Прізвище:' at: 1 @ 2;
		add: surname at: 2 @ 2 span: 2 @ 1;
		add: 'Досвід:' at: 1 @ 3;
		add: experience at: 2 @ 3 span: 2 @ 1;
		add: 'Оплата за годину:' at: 1 @ 4;
		add: hourlyRate at: 2 @ 4 span: 2 @ 1;
		add: 'Мінімум годин:' at: 1 @ 5;
		add: minimumHours at: 2 @ 5 span: 2 @ 1;
		add: 'Тип працівника:' at: 1 @ 6.
	tmp3 := SpBoxLayout newHorizontal.
	tmp3
		add: manager;
		add: programmer.
	tmp2
		add: tmp3 yourself at: 2 @ 6 span: 2 @ 1;
		add: additionalLabel at: 1 @ 7;
		add: additionalInput at: 2 @ 7 span: 2 @ 1;
		add: errorLabel at: 1 @ 8 span: 2 @ 1;
		beColumnNotHomogeneous.
	tmp1 add: tmp2 yourself withConstraints: [ :arg1 |
		arg1
			height: 350;
			expand: false ].
	tmp5 := SpBoxLayout newLeftToRight.
	tmp5
		hAlignCenter;
		add: saveBtn expand: false.
	tmp1 add: tmp5 yourself expand: false.
	^ tmp1 yourself
]

{ #category : 'accessing' }
AddEmployeeWindowPresenter >> employee [
^ employee 
]

{ #category : 'accessing' }
AddEmployeeWindowPresenter >> id: aCompanyId [
id := aCompanyId 
]

{ #category : 'initialization' }
AddEmployeeWindowPresenter >> initializePresenters [

	manager := self newRadioButton label: 'Керівник'.
	programmer := self newRadioButton label: 'Програміст'.
	manager associatedRadioButtons: { programmer }.
	surname := self newTextInput.
	experience := self newTextInput.
	hourlyRate := self newTextInput.
	minimumHours := self newTextInput.
	additionalLabel := self newLabel label: 'Підлеглі: '.
	additionalInput := self newTextInput.
	saveBtn := self newButton label: 'Зберегти'.
	errorLabel := self newLabel.
	self initializeStyles
]

{ #category : 'initialization' }
AddEmployeeWindowPresenter >> initializeStyles [

	self addStyle: 'white'.
	surname addStyle: 'lightGray'.
	experience addStyle: 'lightGray'.
	hourlyRate addStyle: 'lightGray'.
	minimumHours addStyle: 'lightGray'.
	additionalInput addStyle: 'lightGray'.
	saveBtn addStyle: 'buttonGreenStyle'.
	errorLabel addStyle: 'red'
]

{ #category : 'initialization' }
AddEmployeeWindowPresenter >> initializeWindow: arg1 [

	arg1
		title: 'Додати працівника';
		initialExtent: 450 @ 500
]
