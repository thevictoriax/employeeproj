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
Manager class >> surname: aSurname experience: anExperience hourlyRate: anHourlyRate minimumHours: aMinimumHours subordinates: aSubordinates [
        ^self new
            surname: aSurname;
            experience: anExperience;
            hourlyRate: anHourlyRate;
            minimumHours: aMinimumHours;
            subordinates: aSubordinates;
            yourself
]

{ #category : 'arithmetic' }
Manager >> + aSubordinates [
self subordinates: self subordinates + aSubordinates 
]

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
