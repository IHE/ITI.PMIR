## Significate changes from PMIR, Rev 1.3

- Removed inline UML text and moved it to images-source/
- Removed constraint tables for link to profiled resource page.
- Removed inline example and linked to current examples.
- Added in MessageDefinition resources
- Added in CapabilityStatement resources
- Replaced Audit Event tables with profiled AuditEvents
  - Replaced queryParameters in ITI-94 audit with the subscription resource

## Issues

### Open Issues and Questions

- **PMIR-1:** HL7 Patient Administration workgroup is looking at better
defining the patient merge/link functionality in FHIR. We will follow
this work and collaborate with HL7 to keep these efforts aligned. See
<https://confluence.hl7.org/display/PA/Merge+Operation>

- **PMIR-2:** Should we include shall, should, or may for Provenance
resources in the Mobile Patient Identity Feed transaction? This version
doesn’t provide any guidance on Provenance, should it?

- **PMIR-6:** Should we include an option on the Patient Identity Registry
to support the FHIR $match operation on patients? This would require an
additional actor and transaction.

- **PMIR-7:** IHE has submitted a Change Request
[GF\#23009](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=23009)
with HL7 to clarify their usage of link with RelatedPerson as
recommended in this profile to allow for management of parent
relationships to children.

- **PMIR-8:** Should we require maintaining resource versioning
information when updates are made to resources?

- **PMIR-9:** If other domain patient identities are included in the feed,
should there be expected actions on the Patient Identity Registry or
Patient Identity Consumer?

- **PMIR-10:** The security for the feed transaction is currently being
debated in IHE and HL7. The mutual authentication solution in ATNA may
be used. The IUA solution with OAuth identities may be used. These
solutions aren’t straight-forward and resolution of IHE’s recommendation
requires trial implementation feedback.

- **PMIR-11:** CP-ITI-1203 changed the name of a PMIR actor from “Patient
Identity Manager” to “Patient Identity Registry” to better reflect the
passive role that the actor plays in PMIR. There was a suggestion at
that time to change the name of the profile from “Patient Master
Identity Registry” to “Patient Master Identity Registration.” Should the
profile be renamed?


### Closed Issues

- **PMIR-3:** Should Subscription be an option or required on the Patient
Identity Registry? Should the configurable feed destination be an option
or required for Patient Identity Registry?

  - *Subscription is required and there is no requirement for how a
configurable feed destination is handled.*

- ***PMIR-4:** There is a new profile work item in ITI that would bind
this profile and MHD into a FHIR based document sharing health
information exchange. That profile is Mobile Health Document Sharing
(MHDS).*

- **PMIR-5:** In some profiles demographics is used to cover all
demographic information including identifiers. This profile uses
identity to cover demographics and identifiers. Which term is most clear
and should this profile use demographics instead of identity?

  - *We have used identity to cover both identifiers and demographics as
defined under the new glossary terms and in the Concepts section.*
