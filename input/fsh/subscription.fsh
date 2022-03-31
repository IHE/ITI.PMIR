Profile:          PMIRSubscription
Parent:           Subscription
Id:               IHE.PMIR.Subscription
Title:            "IHE Patient Master Identity Registry Subscription"
Description:      """
StructureDefinition for Subscrption resource constraints in the IHE PMIR Profile.

See [Section 3.94.4.1.2.1.1](ITI-94.html#239441211-criteria-constraints) for details
on constraints for criteria.
"""

* contact.system 1..1
* contact.value 1..1
* criteria 1..1
* criteria ^requirements = "Must support Patient, Patient?_id=X, Patient?organization=X, and Patient?identifier=X"
* criteria ^short = "See Section 2:3.94.4.1.2.1.1"
* criteria ^definition = "See Section 2:3.94.4.1.2.1.1"
* channel.type = #message
* channel.endpoint 1..1
* channel.payload 1..1

Profile:          PMIRSubscriptionRequest
Parent:           PMIRSubscription
Id:               IHE.PMIR.Subscription.Request
Title:            "IHE Patient Master Identity Registry Subscription request"
Description:      "StructureDefinition for Subscrption resource constraints for subscription requests in the IHE PMIR Profile.  The IHE PMIR Profile text is Normative, this conformance resource is Informative."
* status = #requested
