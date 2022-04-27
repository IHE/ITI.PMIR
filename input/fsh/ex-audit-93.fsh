Instance:     ex-auditPmirFeed-supplier
InstanceOf:   AuditPmirFeed
Title:        "Audit Example of ITI-93 for Supplier"
Description:  """
AuditEvent for the PMIR Mobile Patient Identity Feed by a Supplier.
"""
Usage:        #example
* type = DCM#110110 "Patient Record"
* subtype = urn:ihe:event-type-code#ITI-93 "Mobile Patient Identity Feed"
* action = http://hl7.org/fhir/audit-event-action#E "Execute"
* recorded = 2022-04-13T19:02:39Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[source]
  * type = DCM#110153 "Source"
  * who = Reference(Device/ex-device)
  * requestor = true
  * network
    * address = "supplier.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[destination]
  * name = "https://pmir.example.org/"
  * type = DCM#110152 "Destination"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network
    * address = "pmir.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* source
  * observer = Reference(Device/ex-device)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[message]
  * type = http://hl7.org/fhir/resource-types#MessageHeader "MessageHeader"
  * what = Reference(MessageHeader/ex-messageheader-create)
  * name = "urn:ihe:iti:pmir:2019:patient-feed"

Instance:     ex-auditPmirFeed-consumer
InstanceOf:   AuditPmirFeed
Title:        "Audit Example of ITI-93 for Consumer"
Description:  """
AuditEvent for the PMIR Mobile Patient Identity Feed by a Consumer.
"""
Usage:        #example
* type = DCM#110110 "Patient Record"
* subtype = urn:ihe:event-type-code#ITI-93 "Mobile Patient Identity Feed"
* action = http://hl7.org/fhir/audit-event-action#E "Execute"
* recorded = 2022-04-13T19:02:40Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[source]
  * type = DCM#110153 "Source"
  * who = Reference(Device/ex-device)
  * requestor = true
  * network
    * address = "supplier.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[destination]
  * name = "https://pmir.example.org/"
  * type = DCM#110152 "Destination"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network
    * address = "pmir.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* source
  * observer = Reference(Device/ex-pmir)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[message]
  * type = http://hl7.org/fhir/resource-types#MessageHeader "MessageHeader"
  * what = Reference(MessageHeader/ex-messageheader-create)
  * name = "urn:ihe:iti:pmir:2019:patient-feed"

Instance:     ex-device
InstanceOf:   Device
Title:        "Device Example for PMIR"
Description:  """
Device Example for PMIR.
"""
Usage:        #example

Instance:     ex-pmir
InstanceOf:   Device
Title:        "Device Example for PMIR"
Description:  """
Device Example for PMIR.
"""
Usage:        #example