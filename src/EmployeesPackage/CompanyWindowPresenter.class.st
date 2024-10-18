Class {
	#name : 'CompanyWindowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'id',
		'list',
		'programmers',
		'managers',
		'mainLabel',
		'addBtn',
		'deleteBtn'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'initialization' }
CompanyWindowPresenter >> connectPresenters [

	addBtn action: [
		| dialog |
		dialog := application newPresenter: AddEmployeeWindowPresenter.
		dialog id: id.
		dialog := dialog open whenClosedDo: [
			          | employee |
			          employee := dialog presenter employee.
			          employee ifNotNil: [
				          employee class = Programmer
					          ifTrue: [
					          application repository addProgrammer: employee ]
					          ifFalse: [ application repository addManager: employee ] ].
			          self redrawList ] ].
	deleteBtn action: [
		list selectedPageIndex = 1
			ifTrue: [
				managers selectedItem ifNotNil: [
					application repository deleteManager: managers selectedItem ] ]
			ifFalse: [
				programmers selectedItem ifNotNil: [
					application repository deleteProgrammer: programmers selectedItem ] ].
		self redrawList ].
]

{ #category : 'layout' }
CompanyWindowPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 20;
		  add: mainLabel expand: false;
		  add: list;
		  add: (SpBoxLayout newHorizontal
				   spacing: 10;
				   add: addBtn expand: false;
				   add: deleteBtn expand: false)
		  withConstraints: [ :arg1 |
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
		addPage: self programmersPage
]

{ #category : 'initialization' }
CompanyWindowPresenter >> initializePresenters [

	list := SpNotebookPresenter new.
	managers := SpTablePresenter new.
	mainLabel := self newLabel.
	addBtn := self newButton label: 'Додати'.
	deleteBtn := self newButton label: 'Видалити'.
	self initializeStyles
]

{ #category : 'initialization' }
CompanyWindowPresenter >> initializeStyles [

	mainLabel addStyle: 'title'.
	addBtn addStyle: 'buttonGreenStyle'.
	deleteBtn addStyle: 'buttonGreenStyle'
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

{ #category : 'as yet unclassified' }
CompanyWindowPresenter >> redrawList [

	managers items:
		(application repository getAllManagersForCompanyId: id).
	programmers items:
		(application repository getAllProgrammersForCompanyId: id).
	self managersPage.
	self programmersPage.
	self defaultLayout.
]
