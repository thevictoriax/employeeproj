Class {
	#name : 'EmloyeesExampleTest',
	#superclass : 'TestCase',
	#category : 'EmployeesPackage',
	#package : 'EmployeesPackage'
}

{ #category : 'running' }
EmloyeesExampleTest >> setUp [ 
        | employeesTest |
			employeesTest := EmloyeesExample new.
         employeesTest initialize.

	"Put here a common initialization logic for tests"
]

{ #category : 'running' }
EmloyeesExampleTest >> tearDown [
	| employeesTest |
	employeesTest := nil.
]

{ #category : 'tests' }
EmloyeesExampleTest >> testAddEmployeeAndHighestPaid [ 
    | highestPaidEmployee employeesTest |
    
    "Initialize the employeesTest object"
    employeesTest := EmloyeesExample new.
    employeesTest initialize.
    
    "Add employees"
    employeesTest addEmployee: (Programmer surname: 'Alice' experience: 8 hourlyRate: 100 minimumHours: 40 actualHours: 50).
    employeesTest addEmployee: (Manager surname: 'Bob' experience: 15 hourlyRate: 150 minimumHours: 45 subordinates: 5).
    
    "Find the highest paid employee"
    highestPaidEmployee := employeesTest highestPaidEmployee.
    
    "Assert that the highest paid employee is Bob"
    self assert: (highestPaidEmployee surname = 'Bob').
    
    self assert: (highestPaidEmployee surname = 'Bob').
]

{ #category : 'tests' }
EmloyeesExampleTest >> testEmployeeComparison [ 
    | employee1 employee2 |
    employee1 := Employee surname: 'Smith' experience: 5 hourlyRate: 100 minimumHours: 40.
    employee2 := Employee surname: 'Doe' experience: 10 hourlyRate: 80 minimumHours: 40.
    
    self assert: (employee1 > employee2).
    self assert: (employee2 < employee1).
    self assert: (employee1 salary > employee2 salary).
]

{ #category : 'tests' }
EmloyeesExampleTest >> testEmployeeSalary [ 
    | employee |
    employee := Employee surname: 'Smith' experience: 5 hourlyRate: 100 minimumHours: 40.
    self assert: (employee salary = 4000).
]

{ #category : 'tests' }
EmloyeesExampleTest >> testManagerAddSubordinates [ 
    | manager |
    manager := Manager surname: 'Bob' experience: 15 hourlyRate: 150 minimumHours: 45 subordinates: 5.
    manager + 3.
    
    self assert: (manager subordinates = 8).
]

{ #category : 'tests' }
EmloyeesExampleTest >> testManagerSalary [ 
      | manager expectedSalary |
    
    "Create a new manager"
    manager := Manager surname: 'Bob' experience: 15 hourlyRate: 150 minimumHours: 45 subordinates: 5.
    
    "Expected salary: (150 * 45) * (1 + 5 * 0.01) = 7087.5"
    expectedSalary := 7087.5.
    
    "Compare the manager's salary with the expected salary allowing for a small margin of error"
    self assert: ((manager salary - expectedSalary) abs < 0.01).
]

{ #category : 'tests' }
EmloyeesExampleTest >> testProgrammerAddHours [ 
    | programmer |
    programmer := Programmer surname: 'Alice' experience: 8 hourlyRate: 100 minimumHours: 40 actualHours: 50.
    programmer + 5.
    
    self assert: (programmer actualHours = 55).
]

{ #category : 'tests' }
EmloyeesExampleTest >> testProgrammerSalary [ 
    | programmer |
    programmer := Programmer surname: 'Alice' experience: 8 hourlyRate: 100 minimumHours: 40 actualHours: 50.
    
    self assert: (programmer salary = 5000).
]

{ #category : 'tests' }
EmloyeesExampleTest >> testReadEmployeesFromFile [ 
     | employeesTest filePath |

    "Initialize employeesTest"
    employeesTest := EmloyeesExample new.
    employeesTest initialize.

    "Define the input file path"
    filePath := 'C:\Users\bozen\Documents\pharo_labs\team_lab1\src\employees.txt'.

    "Read employees from the file"
    employeesTest readEmployeesFromFile: filePath.

    "Assert that the correct number of employees was loaded"
    self assert: (employeesTest employees size = 5).
]

{ #category : 'tests' }
EmloyeesExampleTest >> testSaveEmployeesToFile [ 
    | employeesTest filePath |

    "Initialize employeesTest"
    employeesTest := EmloyeesExample new.
    employeesTest initialize.

    "Add some employees to the test collection"
    employeesTest addEmployee: (Programmer surname: 'Alice' experience: 8 hourlyRate: 100 minimumHours: 40 actualHours: 50).
    employeesTest addEmployee: (Manager surname: 'Bob' experience: 15 hourlyRate: 150 minimumHours: 45 subordinates: 5).

    "Define the output file path"
    filePath := 'C:\Users\bozen\Documents\pharo_labs\team_lab1\src\employees_output.json'.

    "Save employees to file in JSON format"
    employeesTest saveEmployeesToFile: filePath inFormat: 'JSON'.

    "Check if the file has been created"
    self assert: ((FileSystem workingDirectory / filePath) exists).
]

{ #category : 'tests' }
EmloyeesExampleTest >> testSeparateEmployees [ 
    | employeesTest |

	"Initialize employeesTest"
    employeesTest := EmloyeesExample new.
    employeesTest initialize.

	employeesTest addEmployee: (Programmer surname: 'Alice' experience: 8 hourlyRate: 100 minimumHours: 40 actualHours: 50).
    employeesTest addEmployee: (Manager surname: 'Bob' experience: 15 hourlyRate: 150 minimumHours: 45 subordinates: 5).
    
    employeesTest separateEmployees.
    
    self assert: (employeesTest managers size = 1).
    self assert: (employeesTest programmers size = 1).
]
