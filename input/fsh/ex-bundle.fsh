Instance:         ex-PMIRBundleMerge
InstanceOf:       PMIRBundle
Title:            "IHE Patient Master Identity Registry Message Bundle Merge Example"
Description:      "IHE PMIR example Bundle for a patient that has been merged."
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry]
  * fullUrl = "MessageHeader/ex-messageheader-merge"
  * resource = ex-messageheader-merge
* entry[PMIRBundleHistoryEntry]
  * fullUrl = "Bundle/ex-bundle-history-merge"
  * resource = ex-bundle-history-merge


Instance:         ex-bundle-history-merge 
InstanceOf:       PMIRBundleHistory
Title:            "PMIR History Bundle for merge"
Description:      "Example PMIR History Bundle for merging."
Usage:            #example
* id = "ex-bundle-history-merge"
* type = #history
* entry[PMIREntryUpdate]
  * fullUrl = "http://example.com/fhir/Patient/123"
  * resource = ex-patient-merge
  * request
    * method = #PUT
    * url = "Patient/ex-patient-merge"
  * response
    * status = "200"

Instance:         ex-messageheader-merge
InstanceOf:       PMIRMessageHeader 
Title:            "PMIR example MessageHeader for merge"
Description:      "Example PMIR MessageHeader for merging."
Usage:            #example
* id = "ex-messageheader-merge"
* eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* source.endpoint = "http://example.com/patientSource"
* focus = Reference(Bundle/ex-bundle-history-merge)
* destination.endpoint = "http://example.com/patientEndpoint"

Instance:         ex-patient-merge
InstanceOf:       PMIRPatientMerge 
Title:            "PMIR example Patient for merge"
Description:      "Example PMIR Patient for merging."
Usage:            #example
* id = "ex-patient-merge"
* active = false
* link.other = Reference(Patient/ex-patient-merged)
* link.type = #replaced-by

Instance:         ex-patient-merged
InstanceOf:       Patient 
Title:            "PMIR example Patient for merge"
Description:      "Example PMIR Patient for merging."
Usage:            #example
* id = "ex-patient-merged"
* active = true

Instance:         ex-PMIRBundleCreate
InstanceOf:       PMIRBundle
Title:            "IHE Patient Master Identity Registry Message Bundle Create Example"
Description:      "IHE PMIR example to create two patients."
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry]
  * fullUrl = "MessageHeader/ex-messageheader-create"
  * resource = ex-messageheader-create
* entry[PMIRBundleHistoryEntry]
  * fullUrl = "Bundle/ex-bundle-history-create"
  * resource = ex-bundle-history-create


Instance:         ex-bundle-history-create 
InstanceOf:       PMIRBundleHistory
Title:            "PMIR History Bundle for create"
Description:      "Example PMIR History Bundle for creating."
Usage:            #example
* id = "ex-bundle-history-create"
* type = #history
* entry[PMIREntryCreate][+]
  * fullUrl = "urn:uuid:14298d90-b285-4c4c-8252-5d4e7bb5fdb6"
  * resource = ex-patient-create1
  * request
    * method = #POST
    * url = "Patient"
  * response
    * status = "201"
    * location = "Patient/ex-patient-create1/_history/1"
* entry[PMIREntryCreate][+]
  * fullUrl = "urn:uuid:95e1726c-9c3c-4de3-bebc-15daed6b6d34"
  * resource = ex-patient-create2
  * request
    * method = #POST
    * url = "Patient"
  * response
    * status = "201"
    * location = "Patient/ex-patient-create2/_history/1"

Instance:         ex-messageheader-create
InstanceOf:       PMIRMessageHeader 
Title:            "PMIR example MessageHeader for create"
Description:      "Example PMIR MessageHeader for creating."
Usage:            #example
* id = "ex-messageheader-create"
* eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* source.endpoint = "http://example.com/patientSource"
* focus = Reference(Bundle/ex-bundle-history-create)
* destination.endpoint = "http://example.com/patientEndpoint"

Instance:         ex-patient-create1
InstanceOf:       Patient 
Title:            "PMIR example Patient for create"
Description:      "Example PMIR Patient for creating."
Usage:            #example
* active = true
* name
  * use = #official
  * family = "Riegel"
  * given[+] = "David"
  * given[+] = "A."
* gender = #male
* birthDate = "1985-07-12"
* telecom[+]
  * use = #work
  * system = #phone
  * value = "+1-734-942-9512"
* telecom[+]
  * use = #work
  * system = #email
  * value = "DavidARiegel@jourrapide.com"
* address[+]
  * use = #home
  * type = #both
  * line = "4512 Bombardier Way"
  * city = "Romulus"
  * state = "MI"
  * postalCode = "48174"
  * country = "US"
  * text = "4512 Bombardier Way\nRomulus, MI 48174"

Instance:         ex-patient-create2
InstanceOf:       PMIRPatientRelated
Title:            "PMIR example Patient for create"
Description:      "Example PMIR Patient for creating."
Usage:            #example
* active = true
* name
  * use = #official
  * family = "Wooten"
  * given[+] = "Lucille"
  * given[+] = "T."
* gender = #female
* birthDate = "1971-12-14"
* telecom[+]
  * use = #work
  * system = #phone
  * value = "+1-570-508-4343"
* telecom[+]
  * use = #work
  * system = #email
  * value = "LucilleTWooten@teleworm.us"
* address[+]
  * use = #home
  * type = #both
  * line = "3799 High Meadow Lane"
  * city = "Scranton"
  * state = "PA"
  * postalCode = "18503"
  * country = "US"
  * text = "3799 High Meadow Lane\nScranton, PA 18503"
* link.other = Reference(RelatedPerson/ex-related-mom)
* link.type = #seealso

Instance:         ex-related-mom
InstanceOf:       PMIRRelatedPerson
Title:            "PMIR Example of a Related Person for Mother"
Description:      "PMIR Example of a Related Person for Mother."
Usage:            #example
* id = "ex-related-mom"
* patient = Reference(Patient/ex-related-child)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH

Instance:         ex-related-child
InstanceOf:       Patient
Title:            "PMIR example Patient for create"
Description:      "Example PMIR Patient for creating."
Usage:            #example
* id = "ex-related-child"
* active = true
* name
  * use = #official
  * family = "Wooten"
  * given[+] = "Baby"

Instance:         ex-PMIRBundleUpdate
InstanceOf:       PMIRBundle
Title:            "IHE Patient Master Identity Registry Message Bundle Update Example"
Description:      "IHE PMIR example to update a patient."
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry]
  * fullUrl = "MessageHeader/ex-messageheader-update"
  * resource = ex-messageheader-update
* entry[PMIRBundleHistoryEntry]
  * fullUrl = "Bundle/ex-bundle-history-update"
  * resource = ex-bundle-history-update

Instance:         ex-bundle-history-update 
InstanceOf:       PMIRBundleHistory
Title:            "PMIR History Bundle for update"
Description:      "Example PMIR History Bundle for updating."
Usage:            #example
* id = "ex-bundle-history-update"
* type = #history
* entry[PMIREntryUpdate]
  * fullUrl = "http://example.com/fhir/Patient/ex-patient-update"
  * resource = ex-patient-update
  * request
    * method = #PUT
    * url = "Patient/ex-patient-update"
  * response
    * status = "200"
    * location = "Patient/ex-patient-update/_history/2"

Instance:         ex-messageheader-update
InstanceOf:       PMIRMessageHeader 
Title:            "PMIR example MessageHeader for update"
Description:      "Example PMIR MessageHeader for updating."
Usage:            #example
* id = "ex-messageheader-update"
* eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* source.endpoint = "http://example.com/patientSource"
* focus = Reference(Bundle/ex-bundle-history-update)
* destination.endpoint = "http://example.com/patientEndpoint"

Instance:         ex-patient-update
InstanceOf:       Patient 
Title:            "PMIR example Patient for update"
Description:      "Example PMIR Patient for updating."
Usage:            #example
* id = "ex-patient-update"
* active = true
* name
  * use = #official
  * family = "Riegel"
  * given[+] = "David"
  * given[+] = "A."
* gender = #male
* birthDate = "1985-07-12"
* telecom[+]
  * use = #work
  * system = #phone
  * value = "+1-812-863-3613"
* telecom[+]
  * use = #work
  * system = #email
  * value = "DavidARiegel@jourrapide.com"
* address[+]
  * use = #home
  * type = #both
  * line = "4392 Stratford Park"
  * city = "Owensburg"
  * state = "IN"
  * postalCode = "47453"
  * country = "US"
  * text = "4392 Stratford Park\nOwensburg, IN 47453"


Instance:         ex-PMIRBundleDelete
InstanceOf:       PMIRBundle
Title:            "IHE Patient Master Identity Registry Message Bundle Delete Example"
Description:      "IHE PMIR example to delete a patient."
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry]
  * fullUrl = "MessageHeader/ex-messageheader-delete"
  * resource = ex-messageheader-delete
* entry[PMIRBundleHistoryEntry]
  * fullUrl = "Bundle/ex-bundle-history-delete"
  * resource = ex-bundle-history-delete


Instance:         ex-bundle-history-delete 
InstanceOf:       PMIRBundleHistory
Title:            "PMIR History Bundle for delete"
Description:      "Example PMIR History Bundle for deleting."
Usage:            #example
* id = "ex-bundle-history-delete"
* type = #history
* entry[PMIREntryDelete]
  * fullUrl = "Patient/ex-patient-delete"
  * request
    * method = #DELETE
    * url = "Patient/ex-patient-delete"
  * response
    * status = "202"

Instance:         ex-messageheader-delete
InstanceOf:       PMIRMessageHeader 
Title:            "PMIR example MessageHeader for delete"
Description:      "Example PMIR MessageHeader for deleting."
Usage:            #example
* id = "ex-messageheader-delete"
* eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* source.endpoint = "http://example.com/patientSource"
* focus = Reference(Bundle/ex-bundle-history-delete)
* destination.endpoint = "http://example.com/patientEndpoint"
