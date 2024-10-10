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
Programmer class >> surname: aSurname experience: anExperience hourlyRate: anHourlyRate minimumHours: aMinimumHours actualHours: anActualHours [
        ^self new
            surname: aSurname;
            experience: anExperience;
            hourlyRate: anHourlyRate;
            minimumHours: aMinimumHours;
            actualHours: anActualHours.
]

{ #category : 'arithmetic' }
Programmer >> + aHours [
self actualHours: self actualHours + aHours.
]

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
