Instance:     ex-auditPmirFeed-subscriber
InstanceOf:   AuditPmirFeedSubscription
Title:        "Audit Example of ITI-94 for Patient Identity Subscriber"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Subscriber.
"""
Usage:        #example
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "RESTful Operation"
* subtype = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#C
* recorded = 2022-04-13T19:33:45Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[source]
  * type = DCM#110153 "Source"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[requestor]
  * who = Reference(Practitioner/ex-practitioner)
  * requestor = true
* agent[destination]
  * name = "https://pmir.example.org"
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
  * what = Reference(Patient/ex-patient)
* entity[subscription]
  * type = http://hl7.org/fhir/resource-types#Subscription "Subscription"
  * role = http://terminology.hl7.org/CodeSystem/object-role#9 "Subscriber"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="

Instance:     ex-auditPmirFeed-registry
InstanceOf:   AuditPmirFeedSubscription
Title:        "Audit Example of ITI-94 for Patient Identity Registry"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Registry.
"""
Usage:        #example
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "RESTful Operation"
* subtype = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#C
* recorded = 2022-04-13T19:33:46Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[source]
  * type = DCM#110153 "Source"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[requestor]
  * who = Reference(Practitioner/ex-practitioner)
  * requestor = true
* agent[destination]
  * name = "https://pmir.example.org"
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
  * what = Reference(Patient/ex-patient)
* entity[subscription]
  * type = http://hl7.org/fhir/resource-types#Subscription "Subscription"
  * role = http://terminology.hl7.org/CodeSystem/object-role#9 "Subscriber"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="