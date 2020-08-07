Profile:          IHE_PMIR_Bundle
Parent:           Bundle
Title:            "IHE Patient Master Identity Registry Message Bundle"
Description:      "StructureDefinition for Bundle resource constraints in the IHE PMIR Profile.  The IHE PMIR Profile text is Normative, this conformance resource is Informative."
* type = #message
* entry 2..2
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.ordered = true
* entry contains PMIRMessageHeaderEntry 1..1 and PMIRBundleHistoryEntry 1..1
* entry[PMIRMessageHeaderEntry].fullUrl 1..1
* entry[PMIRMessageHeaderEntry].resource only IHE_PMIR_MessageHeader
* entry[PMIRBundleHistoryEntry].fullUrl 1..1
* entry[PMIRBundleHistoryEntry].resource only IHE_PMIR_Bundle_History

Profile:          IHE_PMIR_MessageHeader
Parent:           MessageHeader
Title:            "IHE Patient Master Identity Registry MessageHeader"
Description:      "StructureDefinition for MessageHeader resource constraints in the IHE PMIR Profile.  The IHE PMIR Profile text is Normative, this conformance resource is Informative."
* event[x] only uri
* eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* destination 1..*
* focus 1..1
* focus only Reference(IHE_PMIR_Bundle_History)
* sender ^requirements = "Required if known"
* enterer ^requirements = "Required if known"
* author ^requirements = "Required if known"
* responsible ^requirements = "Required if known"


Profile:          IHE_PMIR_Bundle_History
Parent:           Bundle
Title:            "IHE Patient Master Identity Registry Bundle Message"
Description:      "StructureDefinition for Bundle resource constraints for messages in the IHE PMIR Profile.  The IHE PMIR Profile text is Normative, this conformance resource is Informative."
* type = #history
* entry 1..*
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains PMIRPatientEntry 1..*
* entry[PMIRPatientEntry].resource only Patient
* entry[PMIRPatientEntry].request 1..1
* entry[PMIRPatientEntry].request.method 1..1
* entry[PMIRPatientEntry].response 1..1
* entry[PMIRPatientEntry].response.status 1..1
