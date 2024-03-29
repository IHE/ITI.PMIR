Profile:          PMIRBundleHistory
Parent:           Bundle
Id:               IHE.PMIR.Bundle.History
Title:            "IHE Patient Master Identity Registry Bundle Message"
Description:      "StructureDefinition for Bundle resource constraints for messages in the IHE PMIR Profile."
* type = #history
* entry 1..*
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "request.method"
* entry ^slicing.rules = #closed
* entry contains 
  PMIREntryCreate 0..* and
  PMIREntryUpdate 0..* and
  PMIREntryDelete 0..* 
* entry[PMIREntryCreate]
  * resource 1..1
  * resource only Patient
  * request 1..1
    * method = #POST
    * url 1..1
  * response 1..1
    * status 1..1
* entry[PMIREntryUpdate]
  * resource 1..1
  * resource only Patient
  * request 1..1
    * method = #PUT
    * url 1..1
  * response 1..1
    * status 1..1
* entry[PMIREntryDelete]
  * resource only Patient
  * request 1..1
    * method = #DELETE
    * url 1..1
  * response 1..1
    * status 1..1  

Profile:          PMIRPatientMerge
Parent:           Patient
Id:               IHE.PMIR.Patient.Merge
Title:            "IHE Patient Master Identity Registry Merged Patient"
Description:      "StructureDefinition for Patient resource constraints for messages in the IHE PMIR Profile when the Patient is being merged."

* active = false
* link 1..1
  * type = #replaced-by
  * other only Reference(Patient)

Profile:          PMIRPatientRelated
Parent:           Patient
Id:               IHE.PMIR.Patient.Related
Title:            "IHE Patient Master Identity Registry Related Person Patient"
Description:      "StructureDefinition for Patient resource constraints for messages in the IHE PMIR Profile when the Patient is linked to a related person."

* link 1..1
  * type = #seealso
  * other only Reference(PMIRRelatedPerson)

Profile:          PMIRRelatedPerson
Parent:           RelatedPerson
Id:               IHE.PMIR.RelatedPerson
Title:            "IHE Patient Master Identity Registry Related Person"
Description:      "StructureDefinition for RelatedPerson resource constraints for messages in the IHE PMIR Profile when a Patient is linked to a related person."

* patient 1..1
* patient only Reference(Patient)
* relationship 1..*
* relationship from http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype (required)
