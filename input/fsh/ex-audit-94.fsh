Instance:     ex-auditPmirSubscription-subscriber-create
InstanceOf:   AuditPmirSubscriptionCreate
Title:        "Audit Example of ITI-94 for Patient Identity Subscriber for Create"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Subscriber
when creating a Subscription.
"""
Usage:        #example
* subtype[+] = http://hl7.org/fhir/restful-interaction#create "create"
* subtype[+] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#C
* recorded = 2022-04-13T19:33:45Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[client]
  * type = DCM#110153 "Source Role ID"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[user]
  * type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST "Custodian"
  * who.identifier.system = "http://example.org/practitioner"
  * who.identifier.value = "1234567890"
  * requestor = true
* agent[server]
  * type = DCM#110152 "Destination Role ID"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network 
    * address = "https://pmir.example.org"
    * type = http://hl7.org/fhir/network-type#5 "URI"
* source
  * observer = Reference(Device/ex-device)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="
  * description = "Patient"

Instance:     ex-auditPmirSubscription-registry-create
InstanceOf:   AuditPmirSubscriptionCreate
Title:        "Audit Example of ITI-94 for Patient Identity Registry for Subscription Create"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Registry to create a Subscription.
"""
Usage:        #example
* subtype[+] = http://hl7.org/fhir/restful-interaction#create "create"
* subtype[+] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#C
* recorded = 2022-04-13T19:33:46Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[client]
  * type = DCM#110153 "Source Role ID"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[user]
  * type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST "Custodian"
  * who.identifier.system = "http://example.org/practitioner"
  * who.identifier.value = "1234567890"
  * requestor = true
* agent[server]
  * type = DCM#110152 "Destination Role ID"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network 
    * address = "https://pmir.example.org"
    * type = http://hl7.org/fhir/network-type#5 "URI"
* source
  * observer = Reference(Device/ex-pmir)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="
  * description = "Patient"

Instance:     ex-auditPmirSubscription-subscriber-read
InstanceOf:   AuditPmirSubscriptionRead
Title:        "Audit Example of ITI-94 for Patient Identity Subscriber for Read"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Subscriber
when reading a Subscription.
"""
Usage:        #example
* subtype[+] = http://hl7.org/fhir/restful-interaction#read "read"
* subtype[+] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = 2022-04-13T19:33:45Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[client]
  * type = DCM#110152 "Destination Role ID"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[user]
  * type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
  * who.identifier.system = "http://example.org/practitioner"
  * who.identifier.value = "1234567890"
  * requestor = true
* agent[server]
  * type = DCM#110153 "Source Role ID"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network 
    * address = "https://pmir.example.org"
    * type = http://hl7.org/fhir/network-type#5 "URI"
* source
  * observer = Reference(Device/ex-device)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="
  * description = "Patient"

Instance:     ex-auditPmirSubscription-registry-read
InstanceOf:   AuditPmirSubscriptionRead
Title:        "Audit Example of ITI-94 for Patient Identity Registry for Subscription Read"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Registry to read a Subscription.
"""
Usage:        #example
* subtype[+] = http://hl7.org/fhir/restful-interaction#read "read"
* subtype[+] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = 2022-04-13T19:33:46Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[client]
  * type = DCM#110152 "Destination Role ID"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[user]
  * type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
  * who.identifier.system = "http://example.org/practitioner"
  * who.identifier.value = "1234567890"
  * requestor = true
* agent[server]
  * type = DCM#110153 "Source Role ID"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network 
    * address = "https://pmir.example.org"
    * type = http://hl7.org/fhir/network-type#5 "URI"
* source
  * observer = Reference(Device/ex-pmir)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="
  * description = "Patient"

Instance:     ex-auditPmirSubscription-subscriber-update
InstanceOf:   AuditPmirSubscriptionUpdate
Title:        "Audit Example of ITI-94 for Patient Identity Subscriber for Update"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Subscriber
when updating a Subscription.
"""
Usage:        #example
* subtype[+] = http://hl7.org/fhir/restful-interaction#update "update"
* subtype[+] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#U
* recorded = 2022-04-13T19:33:45Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[client]
  * type = DCM#110153 "Source Role ID"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[user]
  * type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST "Custodian"
  * who.identifier.system = "http://example.org/practitioner"
  * who.identifier.value = "1234567890"
  * requestor = true
* agent[server]
  * type = DCM#110152 "Destination Role ID"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network 
    * address = "https://pmir.example.org"
    * type = http://hl7.org/fhir/network-type#5 "URI"
* source
  * observer = Reference(Device/ex-device)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="
  * description = "Patient"

Instance:     ex-auditPmirSubscription-registry-update
InstanceOf:   AuditPmirSubscriptionUpdate
Title:        "Audit Example of ITI-94 for Patient Identity Registry for Subscription Update"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Registry to update a Subscription.
"""
Usage:        #example
* subtype[+] = http://hl7.org/fhir/restful-interaction#update "update"
* subtype[+] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#U
* recorded = 2022-04-13T19:33:46Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[client]
  * type = DCM#110153 "Source Role ID"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[user]
  * type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST "Custodian"
  * who.identifier.system = "http://example.org/practitioner"
  * who.identifier.value = "1234567890"
  * requestor = true
* agent[server]
  * type = DCM#110152 "Destination Role ID"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network 
    * address = "https://pmir.example.org"
    * type = http://hl7.org/fhir/network-type#5 "URI"
* source
  * observer = Reference(Device/ex-pmir)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="
  * description = "Patient"



Instance:     ex-auditPmirSubscription-subscriber-delete
InstanceOf:   AuditPmirSubscriptionDelete
Title:        "Audit Example of ITI-94 for Patient Identity Subscriber for Delete"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Subscriber
when deleting a Subscription.
"""
Usage:        #example
* subtype[+] = http://hl7.org/fhir/restful-interaction#delete "delete"
* subtype[+] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#D
* recorded = 2022-04-13T19:33:45Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[client]
  * type = http://dicom.nema.org/resources/ontology/DCM#110150 "Application"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[user]
  * type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST "Custodian"
  * who.identifier.system = "http://example.org/practitioner"
  * who.identifier.value = "1234567890"
  * requestor = true
* agent[server]
  * type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#custodian  "Custodian"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network 
    * address = "https://pmir.example.org"
    * type = http://hl7.org/fhir/network-type#5 "URI"
* source
  * observer = Reference(Device/ex-device)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="
  * description = "Patient"

Instance:     ex-auditPmirSubscription-registry-delete
InstanceOf:   AuditPmirSubscriptionDelete
Title:        "Audit Example of ITI-94 for Patient Identity Registry for Subscription Delete"
Description:  """
AuditEvent for the PMIR Subscribe to Patient Updates by a Patient Identity Registry to delete a Subscription.
"""
Usage:        #example
* subtype[+] = http://hl7.org/fhir/restful-interaction#delete "delete"
* subtype[+] = urn:ihe:event-type-code#ITI-94 "Subscribe to Patient Updates"
* action = http://hl7.org/fhir/audit-event-action#D
* recorded = 2022-04-13T19:33:46Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent[client]
  * type = http://dicom.nema.org/resources/ontology/DCM#110150 "Application"
  * who = Reference(Device/ex-device)
  * requestor = false
  * network 
    * address = "subscriber.example.org"
    * type = http://hl7.org/fhir/network-type#1 "Machine Name"
* agent[user]
  * type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST "Custodian"
  * who.identifier.system = "http://example.org/practitioner"
  * who.identifier.value = "1234567890"
  * requestor = true
* agent[server]
  * type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#custodian  "Custodian"
  * who = Reference(Device/ex-pmir)
  * requestor = false
  * network 
    * address = "https://pmir.example.org"
    * type = http://hl7.org/fhir/network-type#5 "URI"
* source
  * observer = Reference(Device/ex-pmir)
  * type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * what = Reference(Patient/ex-patient-create1)
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what = Reference(Subscription/ex-subscription)
  * query = "UGF0aWVudD9faWQ9ZXgtcGF0aWVudA=="
  * description = "Patient"