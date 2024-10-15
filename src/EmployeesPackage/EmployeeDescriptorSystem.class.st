Class {
	#name : 'EmployeeDescriptorSystem',
	#superclass : 'DescriptorSystem',
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'as yet unclassified' }
EmployeeDescriptorSystem >> classModelForCompany: aClassModel [

	(aClassModel newAttributeNamed: #id) useDirectAccess: true.
	aClassModel newAttributeNamed: #name
]

{ #category : 'as yet unclassified' }
EmployeeDescriptorSystem >> classModelForManager: aClassModel [

	self tclassModelForEmployee: aClassModel.
	aClassModel newAttributeNamed: #subordinates
]

{ #category : 'initialization' }
EmployeeDescriptorSystem >> classModelForProgrammer: aClassModel [

	self tclassModelForEmployee: aClassModel.
	aClassModel newAttributeNamed: #actualHours
]

{ #category : 'as yet unclassified' }
EmployeeDescriptorSystem >> descriptorForCompany: aDescriptor [

	| table |
	table := self tableNamed: 'COMPANY'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping)
		from: #id
		to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping)
		from: #name
		to: (table fieldNamed: 'name')
]

{ #category : 'as yet unclassified' }
EmployeeDescriptorSystem >> descriptorForManager: aDescriptor [

	| table |
	table := self tableNamed: 'MANAGER'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping)
		from: #id
		to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping)
		from: #surname
		to: (table fieldNamed: 'surname').
	(aDescriptor newMapping: DirectMapping)
		from: #experience
		to: (table fieldNamed: 'experience').
	(aDescriptor newMapping: DirectMapping)
		from: #hourlyRate
		to: (table fieldNamed: 'hourlyRate').
	(aDescriptor newMapping: DirectMapping)
		from: #minimumHours
		to: (table fieldNamed: 'minimumHours').
	(aDescriptor newMapping: DirectMapping)
		from: #subordinates
		to: (table fieldNamed: 'subordinates').
	(aDescriptor newMapping: DirectMapping)
		from: #companyId
		to: (table fieldNamed: 'companyId').
]

{ #category : 'as yet unclassified' }
EmployeeDescriptorSystem >> descriptorForProgrammer: aDescriptor [

	| table |
	table := self tableNamed: 'PROGRAMMER'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping)
		from: #id
		to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping)
		from: #surname
		to: (table fieldNamed: 'surname').
	(aDescriptor newMapping: DirectMapping)
		from: #experience
		to: (table fieldNamed: 'experience').
	(aDescriptor newMapping: DirectMapping)
		from: #hourlyRate
		to: (table fieldNamed: 'hourlyRate').
	(aDescriptor newMapping: DirectMapping)
		from: #minimumHours
		to: (table fieldNamed: 'minimumHours').
	(aDescriptor newMapping: DirectMapping)
		from: #actualHours
		to: (table fieldNamed: 'actualHours').
	(aDescriptor newMapping: DirectMapping)
		from: #companyId
		to: (table fieldNamed: 'companyId').
]

{ #category : 'initialization' }
EmployeeDescriptorSystem >> initialize [

	super initialize
]

{ #category : 'as yet unclassified' }
EmployeeDescriptorSystem >> tableForCOMPANY: aTable [

	(aTable createFieldNamed: 'id' type: platform serial) bePrimaryKey.
	aTable createFieldNamed: 'name' type: (platform varChar: 100)
]

{ #category : 'as yet unclassified' }
EmployeeDescriptorSystem >> tableForMANAGER: aTable [

	| companyField |
	(aTable createFieldNamed: 'id' type: platform serial) bePrimaryKey.
	aTable createFieldNamed: 'surname' type: (platform varChar: 100).
	aTable createFieldNamed: 'experience' type: platform integer.
	aTable createFieldNamed: 'hourlyRate' type: platform integer.
	aTable createFieldNamed: 'minimumHours' type: platform integer.
	aTable createFieldNamed: 'subordinates' type: platform integer.
	companyField := aTable
		                createFieldNamed: 'companyId'
		                type: platform integer.
	aTable
		addForeignKeyFrom: companyField
		to: ((self tableNamed: 'COMPANY') fieldNamed: 'id')
]

{ #category : 'as yet unclassified' }
EmployeeDescriptorSystem >> tableForPROGRAMMER: aTable [

	| companyField |
	(aTable createFieldNamed: 'id' type: platform serial) bePrimaryKey.
	aTable createFieldNamed: 'surname' type: (platform varChar: 100).
	aTable createFieldNamed: 'experience' type: platform integer.
	aTable createFieldNamed: 'hourlyRate' type: platform integer.
	aTable createFieldNamed: 'minimumHours' type: platform integer.
	aTable createFieldNamed: 'actualHours' type: platform integer.
	companyField := aTable
		                createFieldNamed: 'companyId'
		                type: platform integer.
	aTable
		addForeignKeyFrom: companyField
		to: ((self tableNamed: 'COMPANY') fieldNamed: 'id')
]

{ #category : 'as yet unclassified' }
EmployeeDescriptorSystem >> tclassModelForEmployee: aClassModel [

	(aClassModel newAttributeNamed: #id) useDirectAccess: true.
	aClassModel newAttributeNamed: #surname.
	aClassModel newAttributeNamed: #experience.
	aClassModel newAttributeNamed: #hourlyRate.
	aClassModel newAttributeNamed: #minimumHours.
	aClassModel newAttributeNamed: #companyId
]
