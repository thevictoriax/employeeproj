Class {
	#name : 'EmployeeRepository',
	#superclass : 'Object',
	#instVars : [
		'currentSession'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'adding' }
EmployeeRepository >> addCompany: aCompany [

	currentSession inUnitOfWorkDo: [
		currentSession register: aCompany ].
	^ aCompany id
]

{ #category : 'adding' }
EmployeeRepository >> addManager: aManager [

	currentSession inUnitOfWorkDo: [
		currentSession register: aManager ].
	^ aManager id
]

{ #category : 'adding' }
EmployeeRepository >> addProgrammer: aProgrammer [

	currentSession inUnitOfWorkDo: [ currentSession register: aProgrammer ].
	^ aProgrammer id
]

{ #category : 'operations' }
EmployeeRepository >> create [
currentSession createTables
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> deleteCompany: aCompany [

	currentSession inUnitOfWorkDo: [ currentSession delete: aCompany ].
	self initialize
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> deleteManager: aManager [

	currentSession inUnitOfWorkDo: [ currentSession delete: aManager ].
	self initialize
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> deleteProgrammer: aProgrammer [

	currentSession inUnitOfWorkDo: [ currentSession delete: aProgrammer ].
	self initialize
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> getAllCompanies [
^ currentSession read: Company
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> getAllEmployeesForCompanyId: aCompanyId [

	^ (self getAllProgrammersForCompanyId: aCompanyId) , self getAllManagersForCompanyId: aCompanyId.
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> getAllManagersForCompanyId: aCompanyId [
   ^ currentSession read: Manager where: [ :each | each companyId = aCompanyId ].
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> getAllProgrammersForCompanyId: aCompanyId [
   ^ currentSession read: Programmer where: [ :each | each companyId = aCompanyId ].
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> getCompanyById: anId [

	| company |
	company := currentSession
		              read: Company 
		              where: [ :each | each id = anId ].
	company isEmpty
		ifTrue: [ ^ nil ]
		ifFalse: [ ^ company first ]
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> getManagerById: anId [

	| manager |
	manager := currentSession
		              read: Manager
		              where: [ :each | each id = anId ].
	manager isEmpty
		ifTrue: [ ^ nil ]
		ifFalse: [ ^ manager first ]
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> getProgrammerById: anId [

	| programmer |
	programmer := currentSession
		          read: Programmer 
		          where: [ :each | each id = anId ].
	programmer isEmpty
		ifTrue: [ ^ nil ]
		ifFalse: [ ^ programmer first ]
]

{ #category : 'initialization' }
EmployeeRepository >> initialize [

	| login accessor session |
	login := Login new
		         database: PostgreSQLPlatform new;
		         username: 'postgres';
		         password: '';
		         host: 'localhost';
		         port: '5432';
		         databaseName: 'EmployeesDataBase'.
	accessor := DatabaseAccessor forLogin: login.
	accessor login.
	session := GlorpSession new.
	session system:
		(EmployeeDescriptorSystem forPlatform: login database).
	session accessor: accessor.
	currentSession := session
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> updateCompany: aCompany [

	currentSession inUnitOfWorkDo: [
		| company |
		company := currentSession
			              readOneOf: Company 
			              where: [ :each | each id = aCompany id ].
		company name: aCompany name]
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> updateManager: aManager [

	currentSession inUnitOfWorkDo: [
		| manager |
		manager := currentSession
			              readOneOf: Programmer
			              where: [ :each | each id = aManager id ].
		manager surname: aManager surname.
		manager experience: aManager experience.
		manager hourlyRate: aManager hourlyRate.
		manager minimumHours: aManager minimumHours.
		manager subordinates: aManager subordinates.
		manager companyId: aManager companyId ]
]

{ #category : 'as yet unclassified' }
EmployeeRepository >> updateProgrammer: aProgrammer [

	currentSession inUnitOfWorkDo: [
		| programmer |
		programmer := currentSession
			          readOneOf: Programmer 
			          where: [ :each | each id = aProgrammer id ].
		programmer surname: aProgrammer surname.
		programmer experience: aProgrammer experience.
		programmer hourlyRate: aProgrammer hourlyRate.
		programmer minimumHours: aProgrammer minimumHours.
		programmer actualHours: aProgrammer actualHours.
		programmer companyId: aProgrammer companyId ]
]
