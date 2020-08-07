Profile:          IHE_PMIR_Subscription
Parent:           Subscription
Title:            "IHE Patient Master Identity Registry Subscription"
Description:      "StructureDefinition for Subscrption resource constraints in the IHE PMIR Profile.  The IHE PMIR Profile text is Normative, this conformance resource is Informative."
* contact.system 1..1
* contact.value 1..1
* criteria ^requirements = "Must support Patient, Patient?_id=X, Patient?organization=X, and Patient?identifier=X"
* channel.type = #message
* channel.endpoint 1..1
* channel.payload 1..1

Profile:          IHE_PMIR_Subscription_request
Parent:           IHE_PMIR_Subscription
Title:            "IHE Patient Master Identity Registry Subscription request"
Description:      "StructureDefinition for Subscrption resource constraints for subscription requests in the IHE PMIR Profile.  The IHE PMIR Profile text is Normative, this conformance resource is Informative."
* status = #requested
