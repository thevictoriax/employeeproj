Class {
	#name : 'EmloyeesTest',
	#superclass : 'Object',
	#instVars : [
		'employees',
		'managers',
		'programmers'
	],
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'adding' }
EmloyeesTest >> addEmployee: anEmployee [ 
        employees add: anEmployee.
]

{ #category : 'as yet unclassified' }
EmloyeesTest >> createNewEmployee [
        | surname experience hourlyRate minHours employeeType actualHours subordinates newEmployee |
        surname := UIManager default request: 'Enter surname'.
        experience := (UIManager default request: 'Enter experience in years') asInteger.
        hourlyRate := (UIManager default request: 'Enter hourly rate') asInteger.
        minHours := (UIManager default request: 'Enter minimum hours per week') asInteger.
        employeeType := UIManager default chooseFrom: #('Programmer' 'Manager' 'Employee') title: 'Choose employee type'.
        employeeType = 'Programmer' ifTrue: [
            actualHours := (UIManager default request: 'Enter actual hours worked') asInteger.
            newEmployee := Programmer surname: surname experience: experience hourlyRate: hourlyRate minimumHours: minHours  actualHours: actualHours .
        ].
        employeeType = 'Manager' ifTrue: [
            subordinates := (UIManager default request: 'Enter number of subordinates') asInteger.
            newEmployee := Manager surname: surname experience: experience hourlyRate: hourlyRate minimumHours: minHours subordinates: subordinates.
        ].
       employeeType = 'Employee' ifTrue: [
            newEmployee := Employee surname: surname experience: experience hourlyRate: hourlyRate minimumHours: minHours.
        ].

        self addEmployee: newEmployee.
]

{ #category : 'accessing' }
EmloyeesTest >> employees [ 
    ^employees
]

{ #category : 'examples' }
EmloyeesTest >> example [

	| highestPaidEmployee programmer manager|
	self addEmployee: (Programmer
			 surname: 'Valah'
			 experience: 25
			 hourlyRate: 200
			 minimumHours: 40
			 actualHours: 50).
	self addEmployee: (Manager
			 surname: 'Koval'
			 experience: 15
			 hourlyRate: 150
			 minimumHours: 45
			 subordinates: 4).
	self addEmployee: (Programmer
			 surname: 'Kychma'
			 experience: 8
			 hourlyRate: 100
			 minimumHours: 30
			 actualHours: 40).
	self addEmployee: (Manager
			 surname: 'Buk'
			 experience: 30
			 hourlyRate: 250
			 minimumHours: 20
			 subordinates: 10).
	self addEmployee: (Employee
			 surname: 'Kyshnir'
			 experience: 5
			 hourlyRate: 80
			 minimumHours: 40).
	self printEmployees.
	highestPaidEmployee := self highestPaidEmployee.
	Transcript show: 'Highest paid employee: '.
	highestPaidEmployee printOn: Transcript.
	Transcript cr.
	highestPaidEmployee class = Programmer ifTrue: [
		Transcript
			show: 'The highest paid employee is a programmer.';
			cr ].
	Transcript cr.
	
	programmer := employees at: 1.
	Transcript show: 'Programmer before adding hours: '; cr.
   programmer printOn: Transcript.
   Transcript cr.
   programmer + 10.
   Transcript show: 'Programmer after adding hours: '; cr.
   programmer printOn: Transcript.
   Transcript cr.

   manager := employees at: 2.
   Transcript show: 'Manager before adding subordinates: '; cr.
   manager printOn: Transcript.
   Transcript cr.
   manager + 2.
   Transcript show: 'Manager after adding subordinates: '; cr.
   manager printOn: Transcript.
   Transcript cr; cr.

	self separateEmployees
]

{ #category : 'as yet unclassified' }
EmloyeesTest >> generateCSVFormat [ 
    | csv |
    csv := String streamContents: [ :stream |
        employees do: [ :employee |
            stream
                nextPutAll: employee class name; nextPut: $,;
                nextPutAll: employee surname; nextPut: $,;
                nextPutAll: employee experience asString; nextPut: $,;
                nextPutAll: employee hourlyRate asString; nextPut: $,;
                nextPutAll: employee minimumHours asString.
            employee class = Programmer ifTrue: [
                stream nextPut: $,; nextPutAll: employee actualHours asString.
            ].
            employee class = Manager ifTrue: [
                stream nextPut: $,; nextPutAll: employee subordinates asString.
            ].
            stream cr.
        ].
    ].
    ^csv

]

{ #category : 'as yet unclassified' }
EmloyeesTest >> generateJSONFormat [ 
    | json |
    json := String streamContents: [ :stream |
        stream nextPutAll: '['.
        employees withIndexDo: [ :employee :index |
            stream nextPutAll: '{ "type": "', employee class name, '", '.
            stream nextPutAll: '"surname": "', employee surname, '", '.
            stream nextPutAll: '"experience": ', employee experience asString, ', '.
            stream nextPutAll: '"hourlyRate": ', employee hourlyRate asString, ', '.
            stream nextPutAll: '"minimumHours": ', employee minimumHours asString.
            employee class = Programmer ifTrue: [
                stream nextPutAll: ', "actualHours": ', employee actualHours asString.
            ].
            employee class = Manager ifTrue: [
                stream nextPutAll: ', "subordinates": ', employee subordinates asString.
            ].
            stream nextPutAll: ' }'.
            index < employees size ifTrue: [
                stream nextPutAll: ','.
            ].
        ].
        stream nextPutAll: ']' ; cr.
    ].
    ^json

]

{ #category : 'as yet unclassified' }
EmloyeesTest >> generateXMLFormat [ 
    | xml |
    xml := String streamContents: [ :stream |
        stream nextPutAll: '<employees>'; cr.
        employees do: [ :employee |
            stream
                nextPutAll: '<employee type="', employee class name, '">'; cr;
                nextPutAll: '<surname>', employee surname, '</surname>'; cr;
                nextPutAll: '<experience>', employee experience asString, '</experience>'; cr;
                nextPutAll: '<hourlyRate>', employee hourlyRate asString, '</hourlyRate>'; cr;
                nextPutAll: '<minimumHours>', employee minimumHours asString, '</minimumHours>'; cr.
            employee class = Programmer ifTrue: [
                stream nextPutAll: '<actualHours>', employee actualHours asString, '</actualHours>'; cr.
            ].
            employee class = Manager ifTrue: [
                stream nextPutAll: '<subordinates>', employee subordinates asString, '</subordinates>'; cr.
            ].
            stream nextPutAll: '</employee>'; cr.
        ].
        stream nextPutAll: '</employees>'; cr.
    ].
    ^xml

]

{ #category : 'as yet unclassified' }
EmloyeesTest >> highestPaidEmployee [

	| highestPaid |
	highestPaid := nil.
	employees do: [ :each |
		highestPaid
			ifNil: [ highestPaid := each ]
			ifNotNil: [ each > highestPaid ifTrue: [ highestPaid := each ] ] ].

	^ highestPaid
]

{ #category : 'initialization' }
EmloyeesTest >> initialize [ 
employees := OrderedCollection new.
]

{ #category : 'accessing' }
EmloyeesTest >> managers [ 
    ^managers
]

{ #category : 'printing' }
EmloyeesTest >> printEmployees [

	employees do: [ :employee | employee printOn: Transcript. Transcript cr].
	Transcript cr.
]

{ #category : 'accessing' }
EmloyeesTest >> programmers [ 
    ^programmers
]

{ #category : 'as yet unclassified' }
EmloyeesTest >> readEmployeesFromFile: filePath [ 
    | fileStream line employeeType surname experience hourlyRate minHours actualHours subordinates newEmployee |
    
    "Open the file for reading"
    fileStream := (FileSystem workingDirectory / filePath) readStream.
    
    [ fileStream atEnd ] whileFalse: [
        line := fileStream nextLine.
        (line isEmpty) ifFalse: [
            "Split the line by commas"
            line := line findTokens: ','.
            
            "Assign variables based on the content"
            employeeType := line first.
            surname := line second.
            experience := (line third) asInteger.
            hourlyRate := (line fourth) asInteger.
            minHours := (line fifth) asInteger.
            
            "Determine the type of employee and create the appropriate instance"
            employeeType = 'Programmer' ifTrue: [
                actualHours := (line sixth) asInteger.
                newEmployee := Programmer surname: surname experience: experience hourlyRate: hourlyRate minimumHours: minHours actualHours: actualHours.
            ].
            employeeType = 'Manager' ifTrue: [
                subordinates := (line sixth) asInteger.
                newEmployee := Manager surname: surname experience: experience hourlyRate: hourlyRate minimumHours: minHours subordinates: subordinates.
            ].
            employeeType = 'Employee' ifTrue: [
                newEmployee := Employee surname: surname experience: experience hourlyRate: hourlyRate minimumHours: minHours.
            ].
            
            "Add the newly created employee to the employees collection"
            self addEmployee: newEmployee.
        ].
    ].
    fileStream close.

]

{ #category : 'as yet unclassified' }
EmloyeesTest >> saveEmployeesToFile: filePath inFormat: format [ 
    | fileStream formattedData |
    
    "Check format type and generate data accordingly"
    format = 'CSV' ifTrue: [
        formattedData := self generateCSVFormat.
    ].
    format = 'JSON' ifTrue: [
        formattedData := self generateJSONFormat.
    ].
    format = 'XML' ifTrue: [
        formattedData := self generateXMLFormat.
    ].
    
    "Write the formatted data to the file"
    fileStream := (FileSystem workingDirectory / filePath) writeStream.
    fileStream nextPutAll: formattedData.
    fileStream close.
    
    Transcript show: 'Employees saved to ', filePath, ' in ', format, ' format'; cr.

]

{ #category : 'as yet unclassified' }
EmloyeesTest >> separateEmployees [

	managers := employees select: [ :employee | employee class = Manager ].
	programmers := employees select: [ :employee |
		               employee class = Programmer ].
	Transcript cr.
	Transcript
		show: '--- Managers List ---';
		cr.
	managers do: [ :manager |
		manager printOn: Transcript.
		Transcript cr ].
	Transcript cr.
	Transcript
		show: '--- Programmers List ---';
		cr.
	programmers do: [ :programmer |
		programmer printOn: Transcript.
		Transcript cr ]
]
