Instance: IHE.PMIR.PatientIdentitySource
InstanceOf: CapabilityStatement
Usage: #definition
* date = "2022-10-27"
* description = "CapabilityStatement for Patient Identity Source Actor in the IHE IT Infrastructure Technical Framework Supplement [IHE PMIR](index.html)."
* name = "IHE_PMIR_PatientIdentitySource"
* title = "IHE PMIR Patient Identity Source"
* status = #active
* experimental = false
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* messaging[+]
  * documentation = """
For Mobile Patient Identity Feed [ITI-93]
"""
  * supportedMessage
    * mode = #sender
    * definition = "https://profiles.ihe.net/ITI/PMIR/StructureDefintion/IHE.PMIR.MessageDefinition"

Instance: IHE.PMIR.PatientIdentityConsumer
InstanceOf: CapabilityStatement
Usage: #definition
* date = "2022-10-27"
* description = "CapabilityStatement for Patient Identity Consumer Actor in the IHE IT Infrastructure Technical Framework Supplement [IHE PMIR](index.html)."
* name = "IHE_PMIR_PatientIdentityConsumer"
* title = "IHE PMIR Patient Identity Consumer"
* status = #active
* experimental = false
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* messaging[+]
  * documentation = """
For Mobile Patient Identity Feed [ITI-93]
"""
  * supportedMessage
    * mode = #receiver
    * definition = "https://profiles.ihe.net/ITI/PMIR/StructureDefintion/IHE.PMIR.MessageDefinition"

Instance: IHE.PMIR.PatientIdentitySubscriber
InstanceOf: CapabilityStatement
Usage: #definition
* date = "2022-10-27"
* description = "CapabilityStatement for Patient Identity Subscriber Actor in the IHE IT Infrastructure Technical Framework Supplement [IHE PMIR](index.html)."
* name = "IHE_PMIR_PatientIdentitySubscriber"
* title = "IHE PMIR Patient Identity Subscriber"
* status = #active
* experimental = false
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "PMIR Patient Identity Subscriber will create, update, or deleate Subscription resources."
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or SMART-on-FHIR"
  * resource[+]
    * type = #Subscription
    * supportedProfile = "https://profiles.ihe.net/ITI/PMIR/StructureDefinition/IHE.PMIR.Subscription.Request"
    * documentation = """
For Subscribe to Patient Updates [ITI-94]
"""
    * interaction[+].code = #create
    * interaction[+].code = #read
    * interaction[+].code = #update
    * interaction[+].code = #delete


Instance: IHE.PMIR.PatientIdentityRegistry
InstanceOf: CapabilityStatement
Usage: #definition
* date = "2022-10-27"
* description = "CapabilityStatement for the Patient Identity Registry Actor in the IHE IT Infrastructure Technical Framework Supplement [IHE PMIR](index.html)."
* name = "IHE_PMIR_PatientIdentityRegistry"
* title = "IHE PMIR Patient Identity Registry"
* status = #active
* experimental = false
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "PMIR Patient Identity Registry provides capability to manage Master Patient Identity."
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or SMART-on-FHIR"
  * resource[+]
    * type = #Subscription
    * supportedProfile = "https://profiles.ihe.net/ITI/PMIR/StructureDefinition/IHE.PMIR.Subscription.Request"
    * documentation = """
For Subscribe to Patient Updates [ITI-94]
"""
    * interaction[+].code = #create
    * interaction[+].code = #read
    * interaction[+].code = #update
    * interaction[+].code = #delete
  * resource[+]
    * type = #Patient
    * documentation = """
For Mobile Patient Identifier Cross-reference Query [ITI-83]
and Mobile Patient Demographics Query [ITI-78]
"""
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[+]
      * name = "_id"
      * type = #token
      * documentation = "Logical id of this artifact"
    * searchParam[+]
      * name = "active"
      * type = #token
      * documentation = "Whether the patient record is active"
    * searchParam[+]
      * name = "address-city"
      * type = #string
      * documentation = "A city specified in an address"
    * searchParam[+]
      * name = "address-country"
      * type = #string
      * documentation = "A country specified in an address"
    * searchParam[+]
      * name = "address-postalcode"
      * type = #string
      * documentation = "A postalCode specified in an address"
    * searchParam[+]
      * name = "address-state"
      * type = #string
      * documentation = "A state specified in an address"
    * searchParam[+]
      * name = "birthdate"
      * type = #date
      * documentation = "The patient's date of birth"
    * searchParam[+]
      * name = "family"
      * type = #string
      * documentation = "A portion of the family name of the patient"
    * searchParam[+]
      * name = "gender"
      * type = #token
      * documentation = "Gender of the patient"
    * searchParam[+]
      * name = "given"
      * type = #string
      * documentation = "A portion of the given name of the patient"
    * searchParam[+]
      * name = "identifier"
      * type = #token
      * documentation = "A patient identifier"
    * searchParam[+]
      * name = "telecom"
      * type = #token
      * documentation = "The value in any kind of telecom details of the patient"
    * searchParam[+]
      * name = "_lastUpdated"
      * type = #date
      * documentation = "When the resource version last changed"
    * searchParam[+]
      * name = "mothersMaidenName"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * documentation = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity."
    * operation[+]
      * name = "$ihe-pix"
      * definition = "https://profiles.ihe.net/ITI/PIXm/OperationDefinition/IHE_PIXm_pix"
  * interaction.code = #search-system
* messaging[+]
  * documentation = """
For Mobile Patient Identity Feed [ITI-93]
"""
  * supportedMessage
    * mode = #sender
    * definition = "https://profiles.ihe.net/ITI/PMIR/StructureDefintion/IHE.PMIR.MessageDefinition"
* messaging[+]
  * documentation = """
For Mobile Patient Identity Feed [ITI-93]
"""
  * supportedMessage
    * mode = #receiver
    * definition = "https://profiles.ihe.net/ITI/PMIR/StructureDefintion/IHE.PMIR.MessageDefinition"
