Class {
	#name : 'CompanyWindowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'id',
		'list',
		'programmers',
		'managers',
		'mainLabel',
		'addProgrammerBtn',
		'addManagerBtn',
		'saveToFileBtn'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'as yet unclassified' }
CompanyWindowPresenter >> actionPage [
^ (SpNotebookPage title: 'Дії' provider: [  ]) yourself
	
]

{ #category : 'initialization' }
CompanyWindowPresenter >> connectPresenters [

	managers whenSelectionChangedDo: [
		managers selectedItem ifNotNil: [  ] ]
]

{ #category : 'layout' }
CompanyWindowPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 20;
		  add: mainLabel expand: false;
		  add: list;
		  add: (SpBoxLayout newHorizontal 
		  spacing: 10;
		  add: saveToFileBtn expand: false;
		  add: addProgrammerBtn expand: false;
		  add: addManagerBtn expand: false) withConstraints: [ :arg1 |
		arg1
			height: 40;
			expand: false ];
		  yourself
]

{ #category : 'accessing' }
CompanyWindowPresenter >> id: anId [
id := anId 
]

{ #category : 'initialization' }
CompanyWindowPresenter >> initializeLists [

	managers items:
		(application repository getAllManagersForCompanyId: id).
	managers
		addColumn:
			(SpStringTableColumn title: 'Прізвище' evaluated: #surname)
				beSortable;
		addColumn:
			(SpStringTableColumn title: 'Досвід' evaluated: #experience)
				beSortable;
		addColumn:
			(SpStringTableColumn
				 title: 'Оплата за годину'
				 evaluated: #hourlyRate) beSortable;
		addColumn: (SpStringTableColumn
				 title: 'Мінімальні години'
				 evaluated: #minimumHours) beSortable;
		addColumn:
			(SpStringTableColumn title: 'Підлеглі' evaluated: #subordinates)
				beSortable;
		addColumn:
			(SpStringTableColumn title: 'Зарплата' evaluated: #salary)
				beSortable.
	programmers := SpTablePresenter new.
	programmers items:
		(application repository getAllProgrammersForCompanyId: id).
	programmers
		addColumn:
			(SpStringTableColumn title: 'Прізвище' evaluated: #surname)
				beSortable;
		addColumn:
			(SpStringTableColumn title: 'Досвід' evaluated: #experience)
				beSortable;
		addColumn:
			(SpStringTableColumn
				 title: 'Оплата за годину'
				 evaluated: #hourlyRate) beSortable;
		addColumn: (SpStringTableColumn
				 title: 'Мінімальні години'
				 evaluated: #minimumHours) beSortable;
		addColumn: (SpStringTableColumn
				 title: 'Відпрацьовані години'
				 evaluated: #actualHours) beSortable;
		addColumn:
			(SpStringTableColumn title: 'Зарплата' evaluated: #salary)
				beSortable.
	mainLabel label: (application repository getCompanyById: id) name.
	list
		addPage: self managersPage;
		addPage: self programmersPage;
		addPage: self actionPage.
]

{ #category : 'initialization' }
CompanyWindowPresenter >> initializePresenters [

	list := SpNotebookPresenter new.
	managers := SpTablePresenter new.
	mainLabel := self newLabel.
	addProgrammerBtn := self newButton label: 'Додати програміста'.
	addManagerBtn := self newButton label: 'Додати менеджера'.
	saveToFileBtn := self newButton label: 'Зберегти у файл'.
	self initializeStyles
]

{ #category : 'initialization' }
CompanyWindowPresenter >> initializeStyles [

	mainLabel addStyle: 'title'.
	saveToFileBtn addStyle: 'buttonGreenStyle'.
	addProgrammerBtn addStyle: 'buttonGreenStyle'.
	addManagerBtn addStyle: 'buttonGreenStyle'.
]

{ #category : 'initialization' }
CompanyWindowPresenter >> initializeWindow: arg1 [

	arg1
		title: '';
		initialExtent: 700 @ 500
]

{ #category : 'as yet unclassified' }
CompanyWindowPresenter >> managersPage [

	^ (SpNotebookPage title: 'Керівники' provider: [ managers ]) yourself
]

{ #category : 'as yet unclassified' }
CompanyWindowPresenter >> programmersPage [
^ (SpNotebookPage title: 'Програмісти' provider: [ programmers ]) yourself

]
