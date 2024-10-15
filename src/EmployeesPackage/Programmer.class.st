Class {
	#name : 'Programmer',
	#superclass : 'Employee',
	#instVars : [
		'actualHours'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'as yet unclassified' }
Programmer class >> surname: arg1 experience: arg2 hourlyRate: arg3 minimumHours: arg4 actualHours: arg5 [

	| tmp2 |
	tmp2 := self new.
	tmp2
		surname: arg1;
		experience: arg2;
		hourlyRate: arg3;
		minimumHours: arg4.
	^ tmp2 actualHours: arg5
]

{ #category : 'arithmetic' }
Programmer >> + arg1 [

	self actualHours: self actualHours + arg1
]

{ #category : 'as yet unclassified' }
Programmer >> actualHours [

	^ actualHours
]

{ #category : 'accessing' }
Programmer >> actualHours: arg1 [

	actualHours := arg1
]

{ #category : 'as yet unclassified' }
Programmer >> salary [

	actualHours < minimumHours ifTrue: [
		^ hourlyRate * actualHours * 0.75 ].
	^ hourlyRate * actualHours
]
