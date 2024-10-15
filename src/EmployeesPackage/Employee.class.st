Class {
	#name : 'Employee',
	#superclass : 'Object',
	#instVars : [
		'surname',
		'experience',
		'hourlyRate',
		'minimumHours',
		'id',
		'companyId'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'as yet unclassified' }
Employee class >> surname: arg1 experience: arg2 hourlyRate: arg3 minimumHours: arg4 [

	| tmp2 |
	tmp2 := self new.
	tmp2
		surname: arg1;
		experience: arg2;
		hourlyRate: arg3.
	^ tmp2 minimumHours: arg4
]

{ #category : 'comparing' }
Employee >> < arg1 [

	^ self salary < arg1 salary
]

{ #category : 'as yet unclassified' }
Employee >> = arg1 [

	^ self salary = arg1 salary
]

{ #category : 'comparing' }
Employee >> > arg1 [

	^ self salary > arg1 salary
]

{ #category : 'accessing' }
Employee >> companyId [

	^ companyId
]

{ #category : 'accessing' }
Employee >> companyId: anObject [

	companyId := anObject
]

{ #category : 'as yet unclassified' }
Employee >> experience [

	^ experience
]

{ #category : 'as yet unclassified' }
Employee >> experience: arg1 [

	experience := arg1
]

{ #category : 'as yet unclassified' }
Employee >> hash [

	^ self salary hash
]

{ #category : 'as yet unclassified' }
Employee >> hourlyRate [

	^ hourlyRate
]

{ #category : 'as yet unclassified' }
Employee >> hourlyRate: arg1 [

	hourlyRate := arg1
]

{ #category : 'accessing' }
Employee >> id [

	^ id
]

{ #category : 'accessing' }
Employee >> id: anObject [

	id := anObject
]

{ #category : 'as yet unclassified' }
Employee >> minimumHours [

	^ minimumHours
]

{ #category : 'as yet unclassified' }
Employee >> minimumHours: arg1 [

	minimumHours := arg1
]

{ #category : 'printing' }
Employee >> printOn: arg1 [

	super printOn: arg1.
	arg1
		nextPutAll: ' Surname: ' , self surname;
		nextPutAll: ' Experience: ' , self experience asString;
		nextPutAll: ' Salary: ' , self salary asString
]

{ #category : 'as yet unclassified' }
Employee >> salary [

	^ hourlyRate * minimumHours
]

{ #category : 'as yet unclassified' }
Employee >> surname [

	^ surname
]

{ #category : 'as yet unclassified' }
Employee >> surname: arg1 [

	surname := arg1
]
