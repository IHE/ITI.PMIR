Profile:      AuditPmirSubscriptionCreate
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Create
Id:           IHE.PMIR.Audit.Subscription.Create
Title:        "Audit Event for Subscribe to Patient Updates Transaction by the Patient Identity Subscriber and Registry for Create"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Subscribe to Patient Updates Transaction happens
to create a new subscription, as recorded by the Patient Identity Subscriber and Registry.
"""
* subtype 2..*
* subtype contains iti94 1..1
* subtype[iti94] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* entity contains patient 0..* 
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what 1..1
  * what only Reference(Patient)

Profile:      AuditPmirSubscriptionRead
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Read
Id:           IHE.PMIR.Audit.Subscription.Read
Title:        "Audit Event for Subscribe to Patient Updates Transaction by the Patient Identity Subscriber and Registry for Read"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Subscribe to Patient Updates Transaction happens
to read a subscription, as recorded by the Patient Identity Subscriber and Registry.
"""
* subtype 2..*
* subtype contains iti94 1..1
* subtype[iti94] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* entity contains patient 0..* 
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what 1..1
  * what only Reference(Patient)

Profile:      AuditPmirSubscriptionUpdate
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Update
Id:           IHE.PMIR.Audit.Subscription.Update
Title:        "Audit Event for Subscribe to Patient Updates Transaction by the Patient Identity Subscriber and Registry for Update"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Subscribe to Patient Updates Transaction happens
to update a subscription, as recorded by the Patient Identity Subscriber and Registry.
"""
* subtype 2..*
* subtype contains iti94 1..1
* subtype[iti94] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* entity contains patient 0..* 
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what 1..1
  * what only Reference(Patient) 

Profile:      AuditPmirSubscriptionDelete
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Delete
Id:           IHE.PMIR.Audit.Subscription.Delete
Title:        "Audit Event for Subscribe to Patient Updates Transaction by the Patient Identity Subscriber and Registry for Delete"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Subscribe to Patient Updates Transaction happens
to delete a subscription, as recorded by the Patient Identity Subscriber and Registry.
"""
* subtype 2..*
* subtype contains iti94 1..1
* subtype[iti94] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* entity contains patient 0..* 
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what 1..1
  * what only Reference(Patient)  