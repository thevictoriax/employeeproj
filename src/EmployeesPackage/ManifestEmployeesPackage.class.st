"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestEmployeesPackage',
	#superclass : 'PackageManifest',
	#category : 'EmployeesPackage-Manifest',
	#package : 'EmployeesPackage',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestEmployeesPackage class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#EmloyeesExample #separateEmployees #false)) #'2024-10-10T23:13:37.219+03:00') )
]

{ #category : 'code-critics' }
ManifestEmployeesPackage class >> ruleSentNotImplementedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#EmloyeesExampleTest)) #'2024-10-10T23:21:45.869+03:00') )
]

{ #category : 'code-critics' }
ManifestEmployeesPackage class >> ruleUnclassifiedMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#EmployeesPackage)) #'2024-10-11T00:05:46.847+03:00') )
]
