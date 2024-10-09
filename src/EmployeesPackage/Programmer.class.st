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
Programmer >> actualHours [
    ^actualHours
]

{ #category : 'accessing' }
Programmer >> actualHours: anObject [
    actualHours := anObject
]

{ #category : 'as yet unclassified' }
Programmer >> salary [
    actualHours < minimumHours
        ifTrue: [^hourlyRate * actualHours * 0.75]
        ifFalse: [^hourlyRate * actualHours]
]
