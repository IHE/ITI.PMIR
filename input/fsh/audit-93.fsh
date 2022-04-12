Profile:      AuditPmirFeedSupplier
Parent:       AuditEvent
Id:           IHE.PMIR.Feed.Audit.Supplier
Title:        "Audit Event for Mobile Patient Identity Feed by the Supplier"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Mobile Patient Identity Feed Transaction happens, as recorded by the Supplier.
"""
* modifierExtension 0..0
* type = DCM#110110 "Patient Record"
* subtype = urn:ihe:event-type-code#ITI-93 "Mobile Patient Identity Feed"
* recorded 1..1
* outcome 1..1
* outcomeDesc MS
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent contains source 1..1 and destination 1..1
* agent[source].type = DCM#110153 "Source"
* agent[source].who 1..1
* agent[source].network 1..1
* agent[destination].type = DCM#110152 "Destination"
* agent[destination].who 1..1
* agent[destination].network 1..1
* entity 1..*
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity contains patient 1..* and message 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what.identifier 1..1
* entity[message].type = http://hl7.org/fhir/resource-types#MessageHeader "MessageHeader"
* entity[message].what 1..1
* entity[message].what.identifier 1..1
* entity[message].name = "urn:ihe:iti:pmir:2019:patient-feed"

