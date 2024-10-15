Class {
	#name : 'StartWindowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'list',
		'mainLabel'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'initialization' }
StartWindowPresenter >> connectPresenters [

	list whenSelectionChangedDo: [
		list selectedItem ifNotNil: [ application openCompanyWindow: list selectedItem id ] ]
]

{ #category : 'layout' }
StartWindowPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
				 hAlignCenter;
				 spacing: 20;
				 add: mainLabel expand: false;
				 add: list;
				 yourself.
		
]

{ #category : 'initialization' }
StartWindowPresenter >> initializePresenters [
   |tmp1|
	list := self newFilteringList.
	list items: (application repository getAllCompanies ).
	tmp1 := list listPresenter.
	tmp1
		display: [ :arg2 | ' ' , arg2 name , ' ' ];
		sortingBlock: [ :arg3 :arg4 | arg3 name < arg4 name ].
	tmp1 selectItem: 1.
	mainLabel := self newLabel label: 'Доступні компанії'.
	self initializeStyles
]

{ #category : 'initialization' }
StartWindowPresenter >> initializeStyles [

	list addStyle: 'list'.
	mainLabel addStyle: 'title'
]

{ #category : 'initialization' }
StartWindowPresenter >> initializeWindow: arg1 [

	arg1
		title: '';
		initialExtent: 600 @ 500
]
