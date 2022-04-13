Profile:      AuditPmirFeedSubscriber
Parent:       AuditEvent
Id:           IHE.PMIR.Feed.Audit.Subscriber
Title:        "Audit Event for Subscribe to Patient Updates Transaction by the Patient Identity Subscriber"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Subscribe to Patient Updates Transaction happens, as recorded by the Patient Identity Subscriber.
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
* agent[source].type = DCM#110153 "Source"
* agent[source].who 1..1
* agent[source].network 1..1
* agent[source].network.address 1..1
* agent[source].network.type 1..1
* agent[requestor].who 1..1
* agent[requestor].who ^short = "Identity of the human that initiated the transaction."
* agent[destination].name 1..1
* agent[destination].name ^short = "http endpoint URI"
* agent[destination].type = DCM#110152 "Destination"
* agent[destination].who 1..1
* agent[destination].requestor = false
* agent[destination].network 1..1
* agent[destination].network.address 1..1
* agent[destination].network.type 1..1
* entity 1..*
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity contains patient 0..* and subscription 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[subscription].type = http://hl7.org/fhir/resource-types#Subscription "Subscription"
* entity[subscription].role = http://terminology.hl7.org/CodeSystem/object-role#9 "Subscriber"
* entity[subscription].what 1..1
* entity[subscription].what ^short = "The Subscription being created/updated/deleted"
* entity[subscription].query 1..1
* entity[subscription].query ^short = "The Subscription.criteria value"

Profile:      AuditPmirFeedSubscription
Parent:       AuditEvent
Id:           IHE.PMIR.Feed.Audit.Subscription
Title:        "Audit Event for Subscribe to Patient Updates Transaction by the Patient Identity Registry"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Subscribe to Patient Updates Transaction happens, as recorded by the Patient Identity Registry.
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
* agent[source].type = DCM#110153 "Source"
* agent[source].who 1..1
* agent[source].network 1..1
* agent[source].network.address 1..1
* agent[source].network.type 1..1
* agent[requestor].who 1..1
* agent[requestor].who ^short = "Identity of the human that initiated the transaction."
* agent[destination].name 1..1
* agent[destination].name ^short = "http endpoint URI"
* agent[destination].type = DCM#110152 "Destination"
* agent[destination].who 1..1
* agent[destination].requestor = false
* agent[destination].network 1..1
* agent[destination].network.address 1..1
* agent[destination].network.type 1..1
* entity 1..*
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity contains patient 0..* and subscription 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[subscription].type = http://hl7.org/fhir/resource-types#Subscription "Subscription"
* entity[subscription].role = http://terminology.hl7.org/CodeSystem/object-role#9 "Subscriber"
* entity[subscription].what 1..1
* entity[subscription].what ^short = "The Subscription being created/updated/deleted"
* entity[subscription].query 1..1
* entity[subscription].query ^short = "The Subscription.criteria value"