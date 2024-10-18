Class {
	#name : 'Company',
	#superclass : 'Object',
	#instVars : [
		'name',
		'employees',
		'id'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'as yet unclassified' }
Company >> checkManagers [
    | programmersCount managersCollection |
    programmersCount := (employees select: [:emp | emp isKindOf: Programmer]) size.
    managersCollection := employees select: [:emp | emp isKindOf: Manager].
    ^managersCollection allSatisfy: [:man | man subordinates = programmersCount].
]

{ #category : 'as yet unclassified' }
Company >> checkProgrammers [
    | programmerCollection |
    programmerCollection := employees select: [:emp | emp isKindOf: Programmer].
    ^programmerCollection allSatisfy: [:prog | prog actualHours >= prog minimumHours].
]

{ #category : 'accessing' }
Company >> employees: anEmployees [
employees := anEmployees 
]

{ #category : 'as yet unclassified' }
Company >> fire: anEmployee [
    employees remove: anEmployee ifAbsent: [^self error: 'Employee not found'].
]

{ #category : 'as yet unclassified' }
Company >> highestPaidEmployee [
    ^employees detectMax: [:employee | employee salary].
]

{ #category : 'initialization' }
Company >> hire: anEmployee [
    employees add: anEmployee.
]

{ #category : 'accessing' }
Company >> id [
^ id
]

{ #category : 'accessing' }
Company >> id: anId [
id := anId.
]

{ #category : 'initialization' }
Company >> initialize [
    super initialize.
    employees := OrderedCollection new.
]

{ #category : 'accessing' }
Company >> name [

	^ name
]

{ #category : 'initialization' }
Company >> name: aString [
    name := aString.

]

{ #category : 'as yet unclassified' }
Company >> printOn: aStream [
    super printOn: aStream.
    aStream nextPutAll: 'Company: ', name; cr.
    employees do: [:employee | aStream nextPutAll: (employee printString); cr].

]

{ #category : 'as yet unclassified' }
Company >> reviewSalariesWithPolicy: aBlock [
    employees do: [:employee | 
        employee hourlyRate: (aBlock value: employee hourlyRate value: employee experience)].
]

{ #category : 'as yet unclassified' }
Company >> totalSalary [
    ^employees inject: 0 into: [:sum :employee | sum + employee salary].
]
