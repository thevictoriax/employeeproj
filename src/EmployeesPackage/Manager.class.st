Class {
	#name : 'Manager',
	#superclass : 'Employee',
	#instVars : [
		'subordinates'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'initialization' }
Manager >> initialize [
    super initialize.
    minimumHours := 40.
]

{ #category : 'as yet unclassified' }
Manager >> salary [
    ^(hourlyRate * minimumHours) * (1 + (subordinates * 0.01))
]

{ #category : 'accessing' }
Manager >> subordinates [
    ^subordinates
]

{ #category : 'accessing' }
Manager >> subordinates: anObject [
    subordinates := anObject
]
