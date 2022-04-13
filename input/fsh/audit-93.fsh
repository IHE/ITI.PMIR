Profile:      AuditPmirFeed
Parent:       AuditEvent
Id:           IHE.PMIR.Feed.Audit
Title:        "Audit Event for Mobile Patient Identity Feed by the Supplier and Consumer"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Mobile Patient Identity Feed Transaction happens, as recorded by the Supplier and Consumer.
"""
* modifierExtension 0..0
* type = DCM#110110 "Patient Record"
* subtype = urn:ihe:event-type-code#ITI-93 "Mobile Patient Identity Feed"
* action = http://hl7.org/fhir/audit-event-action#E "Execute"
* recorded 1..1
* outcome 1..1
* outcomeDesc MS
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent contains source 1..1 and destination 1..1
* agent[source]
  * type = DCM#110153 "Source"
  * who 1..1
  * network 1..1
    * address 1..1
    * type 1..1
* agent[destination]
  * name 1..1
  * name ^short = "http endpoint URI"
  * type = DCM#110152 "Destination"
  * who 1..1
  * requestor = false
  * network 1..1
    * address 1..1
    * type 1..1
* entity 1..*
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity contains patient 1..* and message 1..1
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what 1..1
* entity[message]
  * type = http://hl7.org/fhir/resource-types#MessageHeader "MessageHeader"
  * what 1..1
  * what ^short = "A reference to the MessageHeader in the message."
  * name = "urn:ihe:iti:pmir:2019:patient-feed"
