Instance:         IHE.PMIR.MessageDefinition
InstanceOf:       MessageDefinition
Title:            "PMIR Mobile Patient Identity Feed [ITI-93] MessageDefinition"
Description:      """
PMIR MessageDefinition for the [Mobile Patient Identity Feed \[ITI-93\]](ITI-93.html)
"""
Usage:            #definition
* status = #active
* date = 2022-03-31
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[+]
  * name = "IHE"
  * telecom
    * system = #url
    * value = "http://ihe.net"
* eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* category = #notification
* focus
  * code = #Bundle
  * profile = "https://profiles.ihe.net/ITI/PMIR/StructureDefintion/IHE.PMIR.Bundle.History"
  * min = 1
  * max = "1"
* responseRequired = #always
* allowedResponse.message = "https://profiles.ihe.net/ITI/PMIR/StructureDefintion/IHE.PMIR.MessageDefinition.Response"

Instance:         IHE.PMIR.MessageDefinition.Response
InstanceOf:       MessageDefinition
Title:            "PMIR Mobile Patient Identity Feed [ITI-93] MessageDefinition Response"
Description:      """
PMIR MessageDefinition Response for the [Mobile Patient Identity Feed \[ITI-93\]](ITI-93.html)
"""
Usage:            #definition
* status = #active
* date = 2022-03-31
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[+]
  * name = "IHE"
  * telecom
    * system = #url
    * value = "http://ihe.net"
* eventUri = "urn:ihe:iti:pmir:2019:patient-feed-response"


Profile:          PMIRBundle
Parent:           Bundle
Id:               IHE.PMIR.Bundle
Title:            "IHE Patient Master Identity Registry Message Bundle"
Description:      "StructureDefinition for Bundle resource constraints in the IHE PMIR Profile."
* type = #message
* entry 2..2
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.ordered = true
* entry contains 
      PMIRMessageHeaderEntry 1..1 and 
      PMIRBundleHistoryEntry 1..1
* entry[PMIRMessageHeaderEntry].fullUrl 1..1
* entry[PMIRMessageHeaderEntry].resource only PMIRMessageHeader
* entry[PMIRBundleHistoryEntry].fullUrl 1..1
* entry[PMIRBundleHistoryEntry].resource only PMIRBundleHistory

Profile:          PMIRMessageHeader
Parent:           MessageHeader
Id:               IHE.PMIR.MessageHeader
Title:            "IHE Patient Master Identity Registry MessageHeader"
Description:      "StructureDefinition for MessageHeader resource constraints in the IHE PMIR Profile."
* event[x] only uri
* eventUri = "urn:ihe:iti:pmir:2019:patient-feed"
* source.endpoint 1..1
* destination 1..*
* focus 1..1
* focus only Reference(PMIRBundleHistory)
* sender MS
* sender ^requirements = "Required if known"
* enterer MS
* enterer ^requirements = "Required if known"
* author MS
* author ^requirements = "Required if known"
* responsible MS
* responsible ^requirements = "Required if known"
* definition = "https://profiles.ihe.net/ITI/PMIR/StructureDefintion/IHE.PMIR.MessageDefinition"

Profile:          PMIRMessageHeaderResponse
Parent:           MessageHeader
Id:               IHE.PMIR.MessageHeader.Response
Title:            "IHE Patient Master Identity Registry MessageHeader Response"
Description:      "StructureDefinition for the PMIR MessageHeader response constraints."
* event[x] only uri
* eventUri = "urn:ihe:iti:pmir:2019:patient-feed-response"
* destination 0..0
* response 1..1
* definition = "https://profiles.ihe.net/ITI/PMIR/StructureDefintion/IHE.PMIR.MessageDefinition.Response"