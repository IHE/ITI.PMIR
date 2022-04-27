Instance:       ex-subscription
InstanceOf:     PMIRSubscription
Title:          "PMIR Example Subscription"
Description:    "Example of PMIR Subscription resource."
Usage:          #example
* status = #active
* contact.system = #phone
* contact.value = "+1-555-555-1212"
* reason = "To receive Patient changes."
* criteria = "Patient"
* channel.type = #message
* channel.endpoint = "http://example.org/pmir-message"
* channel.payload = #application/fhir+json

Instance:       ex-subscription-request
InstanceOf:     PMIRSubscriptionRequest
Title:          "PMIR Example Subscription Request"
Description:    "Example of PMIR Subscription Request resource."
Usage:          #example
* status = #requested
* contact.system = #phone
* contact.value = "+1-555-555-1212"
* reason = "To receive Patient changes."
* criteria = "Patient"
* channel.type = #message
* channel.endpoint = "http://example.org/pmir-message"
* channel.payload = #application/fhir+json