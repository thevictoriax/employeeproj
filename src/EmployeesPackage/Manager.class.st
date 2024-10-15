Class {
	#name : 'Manager',
	#superclass : 'Employee',
	#instVars : [
		'subordinates'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'as yet unclassified' }
Manager class >> surname: arg1 experience: arg2 hourlyRate: arg3 minimumHours: arg4 subordinates: arg5 [

	| tmp2 |
	tmp2 := self new.
	tmp2
		surname: arg1;
		experience: arg2;
		hourlyRate: arg3;
		minimumHours: arg4;
		subordinates: arg5.
	^ tmp2 yourself
]

{ #category : 'arithmetic' }
Manager >> + arg1 [

	self subordinates: self subordinates + arg1
]

{ #category : 'initialization' }
Manager >> initialize [

	super initialize.
	minimumHours := 40
]

{ #category : 'as yet unclassified' }
Manager >> salary [

	^ hourlyRate * minimumHours * (1 + (subordinates * 0.01))
]

{ #category : 'accessing' }
Manager >> subordinates [

	^ subordinates
]

{ #category : 'accessing' }
Manager >> subordinates: arg1 [

	subordinates := arg1
]
