Profile:      AuditPmirFeedSubscription
Parent:       AuditEvent
Id:           IHE.PMIR.Feed.Audit.Subscription
Title:        "Audit Event for Subscribe to Patient Updates Transaction by the Patient Identity Subscriber and Registry"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Subscribe to Patient Updates Transaction happens, as recorded by the Patient Identity Subscriber and Registry.
"""
* modifierExtension 0..0
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "RESTful Operation"
* subtype = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action 1..1
* action ^short = "C (create) , R (read), U (update), or D (delete) as appropriate"
* recorded 1..1
* outcome 1..1
* outcomeDesc MS
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent contains source 1..1 and requestor 0..* and destination 1..1
* agent[source]
  * type = DCM#110153 "Source"
  * who 1..1
  * network 1..1
    * address 1..1
    * type 1..1
* agent[requestor]
  * who 1..1
  * who ^short = "Identity of the human that initiated the transaction."
* agent[destination]
  * type = DCM#110152 "Destination"
  * who 1..1
  * requestor = false
  * network 1..1
    * ^short = "Endpoint of the destination"
    * address 1..1
    * type 1..1
* entity 1..*
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity contains patient 0..* and subscription 1..1
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what 1..1
  * what only Reference(Patient)
* entity[subscription]
  * type = http://hl7.org/fhir/resource-types#Subscription "Subscription"
  * role = http://terminology.hl7.org/CodeSystem/object-role#9 "Subscriber"
  * what 1..1
  * what only Reference(Subscription)
    * ^short = "The Subscription being created/updated/deleted"
  * query 1..1
  * query ^short = "The Subscription.criteria value"