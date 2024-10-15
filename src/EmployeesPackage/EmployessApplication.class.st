Class {
	#name : 'EmployessApplication',
	#superclass : 'SpApplication',
	#instVars : [
		'repository'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'initialization' }
EmployessApplication >> initialize [

	super initialize.
	self useBackend: #Morphic with: EmployeesConfiguration new.
	repository := EmployeeRepository new.
]

{ #category : 'as yet unclassified' }
EmployessApplication >> openCompanyWindow: aCompanyId [

	| window |
	window := self newPresenter: CompanyWindowPresenter.
	window id: aCompanyId.
	window initializeLists.
	window := window open.
	window window
		beUnresizeable;
		removeExpandBox;
		removeCollapseBox;
		removeMenuBox
]

{ #category : 'as yet unclassified' }
EmployessApplication >> openMainPresenter [

	| window |
	window := self newPresenter: StartWindowPresenter .
	window := window open.
	window window
		beUnresizeable;
		removeExpandBox;
		removeCollapseBox;
		removeMenuBox
]

{ #category : 'accessing' }
EmployessApplication >> repository [
^ repository 
]

{ #category : 'running' }
EmployessApplication >> start [ 
self openMainPresenter 
]
