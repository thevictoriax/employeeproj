Class {
	#name : 'Employee',
	#superclass : 'Object',
	#instVars : [
		'surname',
		'experience',
		'hourlyRate',
		'minimumHours'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'as yet unclassified' }
Employee >> = anEmployee [
    ^self salary = anEmployee salary
]

{ #category : 'as yet unclassified' }
Employee >> experience [
    ^experience
]

{ #category : 'as yet unclassified' }
Employee >> experience: anObject [
    experience := anObject
]

{ #category : 'as yet unclassified' }
Employee >> hash [
    ^self salary hash
]

{ #category : 'as yet unclassified' }
Employee >> hourlyRate [
    ^hourlyRate
]

{ #category : 'as yet unclassified' }
Employee >> hourlyRate: anObject [
    hourlyRate := anObject
]

{ #category : 'as yet unclassified' }
Employee >> minimumHours [
    ^minimumHours
]

{ #category : 'as yet unclassified' }
Employee >> minimumHours: anObject [
    minimumHours := anObject
]

{ #category : 'printing' }
Employee >> printOn: aStream [
    super printOn: aStream.
    aStream
        nextPutAll: 'Surname: ', surname;
        nextPutAll: ' Experience: ', experience asString;
        nextPutAll: ' Hourly Rate: ', hourlyRate asString;
        nextPutAll: ' Minimum Hours: ', minimumHours asString.
]

{ #category : 'as yet unclassified' }
Employee >> salary [
    ^hourlyRate * minimumHours
]

{ #category : 'as yet unclassified' }
Employee >> surname [
    ^surname
]

{ #category : 'as yet unclassified' }
Employee >> surname: anObject [
    surname := anObject
]
