Instance:         ex-PMIRBundleMerge
InstanceOf:       PMIRBundle
Title:            "IHE Patient Master Identity Registry Message Bundle Merge Example"
Description:      "IHE PMIR example Bundle for a patient that has been merged."
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry]
  * fullUrl = "http://example.com/fhir/MessageHeader/1"
  * resource
    * resourceType = "MessageHeader"
    * id = "1"
    * eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
    * source.endpoint = "http://example.com/patientSource"
    * focus = Reference(Bundle/abc)
    * destination.endpoint = "http://example.com/patientEndpoint"
* entry[PMIRBundleHistoryEntry]
  * fullUrl = "http://example.com/fhir/Bundle/abc"
  * resource
    * resourceType = "Bundle"
    * id = "abc"
    * type = #history
    * entry[PMIRPatientEntryMerge]
      * fullUrl = "http://example.com/fhir/Patient/123"
      * resource
        * resourceType = "Patient"
        * id = "123"
        * active = false
        * link.other = Reference(http://example.com/fhir/Patient/456)
        * link.type = #replaced-by
      * request
        * method = #PUT
        * url = "Patient/123"
      * response
        * status = "200"

Instance:         ex-PMIRBundleCreate
InstanceOf:       PMIRBundle
Title:            "IHE Patient Master Identity Registry Message Bundle Create Example"
Description:      "IHE PMIR example to create two patients."
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry]
  * fullUrl = "http://example.com/fhir/MessageHeader/2"
  * resource
    * resourceType = "MessageHeader"
    * id = "2"
    * eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
    * source.endpoint = "http://example.com/patientSource"
    * focus = Reference(Bundle/a)
    * destination.endpoint = "http://example.com/patientEndpoint"
* entry[PMIRBundleHistoryEntry]
  * fullUrl = "http://example.com/fhir/Bundle/a"
  * resource
    * resourceType = "Bundle"
    * id = "a"
    * type = #history
    * entry[PMIRPatientEntry][+]
      * fullUrl = "urn:uuid:14298d90-b285-4c4c-8252-5d4e7bb5fdb6"
      * resource
        * resourceType = "Patient"
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
      * request
        * method = #POST
        * url = "Patient"
      * response
        * status = "201"
        * location = "Patient/111/_history/1"
    * entry[PMIRPatientEntry][+]
      * fullUrl = "urn:uuid:95e1726c-9c3c-4de3-bebc-15daed6b6d34"
      * resource
        * resourceType = "Patient"
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
      * request
        * method = #POST
        * url = "Patient"
      * response
        * status = "201"
        * location = "Patient/222/_history/1"

Instance:         ex-PMIRBundleUpdate
InstanceOf:       PMIRBundle
Title:            "IHE Patient Master Identity Registry Message Bundle Update Example"
Description:      "IHE PMIR example to update a patient."
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry]
  * fullUrl = "http://example.com/fhir/MessageHeader/3"
  * resource
    * resourceType = "MessageHeader"
    * id = "3"
    * eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
    * source.endpoint = "http://example.com/patientSource"
    * focus = Reference(Bundle/b)
    * destination.endpoint = "http://example.com/patientEndpoint"
* entry[PMIRBundleHistoryEntry]
  * fullUrl = "http://example.com/fhir/Bundle/b"
  * resource
    * resourceType = "Bundle"
    * id = "b"
    * type = #history
    * entry[PMIRPatientEntry]
      * fullUrl = "http://example.com/fhir/Patient/111"
      * resource
        * resourceType = "Patient"
        * id = "111"
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
      * request
        * method = #PUT
        * url = "Patient/111"
      * response
        * status = "200"
        * location = "Patient/111/_history/2"

Instance:         ex-PMIRBundleDelete
InstanceOf:       PMIRBundle
Title:            "IHE Patient Master Identity Registry Message Bundle Delete Example"
Description:      "IHE PMIR example to delete a patient."
Usage:            #example
* type = #message
* entry[PMIRMessageHeaderEntry]
  * fullUrl = "http://example.com/fhir/MessageHeader/4"
  * resource
    * resourceType = "MessageHeader"
    * id = "4"
    * eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
    * source.endpoint = "http://example.com/patientSource"
    * focus = Reference(Bundle/c)
    * destination.endpoint = "http://example.com/patientEndpoint"
* entry[PMIRBundleHistoryEntry]
  * fullUrl = "http://example.com/fhir/Bundle/c"
  * resource
    * resourceType = "Bundle"
    * id = "c"
    * type = #history
    * entry[PMIRPatientEntry]
      * fullUrl = "http://example.com/fhir/Patient/111"
      * request
        * method = #DELETE
        * url = "Patient/111"
      * response
        * status = "202"