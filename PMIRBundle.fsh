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
* entry contains 
      PMIRMessageHeaderEntry 1..1 and 
      PMIRBundleHistoryEntry 1..1
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

Instance:         IHE_PMIR_Bundle_Example_Merge
InstanceOf:       IHE_PMIR_Bundle
Title:            "IHE Patient Master Identity Registry Message Bundle Merge Example"
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry].fullUrl = "http://example.com/fhir/MessageHeader/1"
* entry[PMIRMessageHeaderEntry].resource.resourceType = "MessageHeader"
* entry[PMIRMessageHeaderEntry].resource.id = "1"
* entry[PMIRMessageHeaderEntry].resource.eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* entry[PMIRMessageHeaderEntry].resource.source.endpoint = "http://example.com/patientSource"
* entry[PMIRMessageHeaderEntry].resource.focus = Reference(Bundle/abc)
* entry[PMIRMessageHeaderEntry].resource.destination.endpoint = "http://example.com/patientEndpoint"
* entry[PMIRBundleHistoryEntry].fullUrl = "http://example.come/fhir/Bundle/abc"
* entry[PMIRBundleHistoryEntry].resource.resourceType = "Bundle"
* entry[PMIRBundleHistoryEntry].resource.id = "abc"
* entry[PMIRBundleHistoryEntry].resource.type = #history
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].fullUrl = "http://example.com/fhir/Patient/123"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.resourceType = "Patient"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.id = "123"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.active = false
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.link.other = Reference(http://example.com/fhir/Patient/456)
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.link.type = #replaced-by
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].request.method = #PUT
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].request.url = "Patient/123"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].response.status = "200"

Instance:         IHE_PMIR_Bundle_Example_Create
InstanceOf:       IHE_PMIR_Bundle
Title:            "IHE Patient Master Identity Registry Message Bundle Create Example"
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry].fullUrl = "http://example.com/fhir/MessageHeader/2"
* entry[PMIRMessageHeaderEntry].resource.resourceType = "MessageHeader"
* entry[PMIRMessageHeaderEntry].resource.id = "2"
* entry[PMIRMessageHeaderEntry].resource.eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* entry[PMIRMessageHeaderEntry].resource.source.endpoint = "http://example.com/patientSource"
* entry[PMIRMessageHeaderEntry].resource.focus = Reference(Bundle/a)
* entry[PMIRMessageHeaderEntry].resource.destination.endpoint = "http://example.com/patientEndpoint"
* entry[PMIRBundleHistoryEntry].fullUrl = "http://example.come/fhir/Bundle/a"
* entry[PMIRBundleHistoryEntry].resource.resourceType = "Bundle"
* entry[PMIRBundleHistoryEntry].resource.id = "a"
* entry[PMIRBundleHistoryEntry].resource.type = #history
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].fullUrl = "urn:uuid:14298d90-b285-4c4c-8252-5d4e7bb5fdb6"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.resourceType = "Patient"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.active = true
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.name.use = #official
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.name.family = "Riegel"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.name.given[0] = "David"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.name.given[1] = "A."
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.gender = #male
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.birthDate = "1985-07-12"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.telecom[0].use = #work
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.telecom[0].system = #phone
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.telecom[0].value = "+1-734-942-9512"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.telecom[1].use = #work
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.telecom[1].system = #email
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.telecom[1].value = "DavidARiegel@jourrapide.com"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.address[0].use = #home
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.address[0].type = #both
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.address[0].line[0] = "4512 Bombardier Way"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.address[0].city = "Romulus"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.address[0].state = "MI"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.address[0].postalCode = "48174"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.address[0].country = "US"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].resource.address[0].text = "4512 Bombardier Way\nRomulus, MI 48174"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].request.method = #POST
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].request.url = "Patient"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].response.status = "201"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][0].response.location = "Patient/111/_history/1"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].fullUrl = "urn:uuid:95e1726c-9c3c-4de3-bebc-15daed6b6d34"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.resourceType = "Patient"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.active = true
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.name.use = #official
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.name.family = "Wooten"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.name.given[0] = "Lucille"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.name.given[1] = "T."
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.gender = #female
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.birthDate = "1971-12-14"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.telecom[0].use = #work
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.telecom[0].system = #phone
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.telecom[0].value = "+1-570-508-4343"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.telecom[1].use = #work
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.telecom[1].system = #email
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.telecom[1].value = "LucilleTWooten@teleworm.us"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.address[0].use = #home
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.address[0].type = #both
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.address[0].line[0] = "3799 High Meadow Lane"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.address[0].city = "Scranton"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.address[0].state = "PA"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.address[0].postalCode = "18503"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.address[0].country = "US"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].resource.address[0].text = "3799 High Meadow Lane\nScranton, PA 18503"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].request.method = #POST
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].request.url = "Patient"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].response.status = "201"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry][1].response.location = "Patient/222/_history/1"

Instance:         IHE_PMIR_Bundle_Example_Update
InstanceOf:       IHE_PMIR_Bundle
Title:            "IHE Patient Master Identity Registry Message Bundle Update Example"
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry].fullUrl = "http://example.com/fhir/MessageHeader/3"
* entry[PMIRMessageHeaderEntry].resource.resourceType = "MessageHeader"
* entry[PMIRMessageHeaderEntry].resource.id = "3"
* entry[PMIRMessageHeaderEntry].resource.eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* entry[PMIRMessageHeaderEntry].resource.source.endpoint = "http://example.com/patientSource"
* entry[PMIRMessageHeaderEntry].resource.focus = Reference(Bundle/b)
* entry[PMIRMessageHeaderEntry].resource.destination.endpoint = "http://example.com/patientEndpoint"
* entry[PMIRBundleHistoryEntry].fullUrl = "http://example.come/fhir/Bundle/b"
* entry[PMIRBundleHistoryEntry].resource.resourceType = "Bundle"
* entry[PMIRBundleHistoryEntry].resource.id = "b"
* entry[PMIRBundleHistoryEntry].resource.type = #history
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].fullUrl = "http://example.com/fhir/Patient/111"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.resourceType = "Patient"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.id = "111"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.active = true
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.name.use = #official
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.name.family = "Riegel"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.name.given[0] = "David"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.name.given[1] = "A."
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.gender = #male
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.birthDate = "1985-07-12"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.telecom[0].use = #work
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.telecom[0].system = #phone
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.telecom[0].value = "+1-812-863-3613"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.telecom[1].use = #work
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.telecom[1].system = #email
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.telecom[1].value = "DavidARiegel@jourrapide.com"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.address[0].use = #home
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.address[0].type = #both
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.address[0].line[0] = "4392 Stratford Park"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.address[0].city = "Owensburg"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.address[0].state = "IN"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.address[0].postalCode = "47453"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.address[0].country = "US"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].resource.address[0].text = "4392 Stratford Park\nOwensburg, IN 47453"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].request.method = #PUT
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].request.url = "Patient/111"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].response.status = "200"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].response.location = "Patient/111/_history/2"

Instance:         IHE_PMIR_Bundle_Example_Delete
InstanceOf:       IHE_PMIR_Bundle
Title:            "IHE Patient Master Identity Registry Message Bundle Delete Example"
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry].fullUrl = "http://example.com/fhir/MessageHeader/4"
* entry[PMIRMessageHeaderEntry].resource.resourceType = "MessageHeader"
* entry[PMIRMessageHeaderEntry].resource.id = "4"
* entry[PMIRMessageHeaderEntry].resource.eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* entry[PMIRMessageHeaderEntry].resource.source.endpoint = "http://example.com/patientSource"
* entry[PMIRMessageHeaderEntry].resource.focus = Reference(Bundle/c)
* entry[PMIRMessageHeaderEntry].resource.destination.endpoint = "http://example.com/patientEndpoint"
* entry[PMIRBundleHistoryEntry].fullUrl = "http://example.come/fhir/Bundle/c"
* entry[PMIRBundleHistoryEntry].resource.resourceType = "Bundle"
* entry[PMIRBundleHistoryEntry].resource.id = "c"
* entry[PMIRBundleHistoryEntry].resource.type = #history
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].fullUrl = "http://example.com/fhir/Patient/111"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].request.method = #DELETE
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].request.url = "Patient/111"
* entry[PMIRBundleHistoryEntry].resource.entry[PMIRPatientEntry].response.status = "202"

