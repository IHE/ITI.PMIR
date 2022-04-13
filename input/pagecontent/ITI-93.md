### 2:3.93.1 Scope

The Mobile Patient Identity Feed transaction sends a FHIR Bundle of new
and updated Patient Resources.

### 2:3.93.2 Actor Roles

The roles in this transaction are defined in the following table and may
be played by the actors shown here:

**Table 2:3.93.2-1: Actor Roles**

| ------ | ----------- |
| **Role:** | Supplier: Sends a bundle of updates. |
| **Actor(s):** | The following actors may play the role of *Supplier:*<br />*Patient Identity Source*<br />*Patient Identity Registry* |
| **Role:** | Consumer: Accepts the bundle request and returns a bundle response. |
| **Actor(s):** | The following actors may play the role of *Consumer:*<br />*Patient Identity Registry*<br />*Patient Identity Consumer* |
{: .grid}

### 2:3.93.3 Referenced Standards

  - HL7 FHIR standard Release 4 [http://hl7.org/fhir/R4/index.html](http://hl7.org/fhir/R4/index.html)

### 2:3.93.4 Messages

<div>
{%include ITI-93-seq.svg%}
</div>
<br clear="all">

**Figure 2:3.93.4-1: Interaction Diagram**

#### 2:3.93.4.1 Mobile Patient Identity Feed Request Message

The Mobile Patient Identity Feed message is a FHIR message with the new
and updated Patient Resource(s).

##### 2:3.93.4.1.1 Trigger Events

A Supplier triggers a Mobile Patient Identity Feed Request to a Consumer
when it detects, according to domain policy, a change in the Patient
Master Identity (see [ITI TF-1: 49](volume-1.html)) i.e., create, update, merge, delete.

A patient’s “Patient Master Identity” contains:

- a unique identifier for the patient (`Patient.id` in the FHIR Patient
  Resource) that is assigned by the Patient Identity Registry in the
  domain.

- zero or more business identifiers for the patient, e.g., local
  patient ID(s), driver’s license number, etc. (`Patient.identifier` in
  the FHIR Patient Resource).

- other information to identify the patient in the FHIR Patient
  Resource.

**Note:** The Consumer is identified either by a subscription in the
[Subscribe to Patient Updates \[ITI-94\]](ITI-94.html) transaction or by a
configuration.

##### 2:3.93.4.1.2 Message Semantics

A Supplier initiates a FHIR message request using HTTP POST as defined
at <https://www.hl7.org/fhir/R4/messaging.html> on a Bundle Resource.

A Supplier shall create a Bundle Resource of type `message` constrained
as specified in Section 2:3.93.4.1.2.1 and conforming to the 
[PMIR Feed MessageDefinition](MessageDefinition-IHE.PMIR.MessageDefinition.html).

A Supplier shall be able to send a request for both the JSON and the XML
messaging formats as defined in FHIR. A Consumer shall support accepting
either the JSON or the XML messaging formats as defined in FHIR
depending on the Subscription or configuration of the Consumer. See [ITI
TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for
this transaction.

###### 2:3.93.4.1.2.1 FHIR Message Bundle Resource Constraints

The message Bundle Resource shall be constrained as described in the [Bundle Profile for PMIR](StructureDefinition-IHE.PMIR.Bundle.html).


###### 2:3.93.4.1.2.2 FHIR MessageHeader Resource Constraints

A Supplier shall create a MessageHeader Resource that is entry\[0\] in
the message Bundle. The MessageHeader Resource shall be constrained as
described the [MessageHeader Profile for PMIR](StructureDefinition-IHE.PMIR.MessageHeader.html)

###### 2:3.93.4.1.2.3 FHIR History Bundle Resource Constraints

A Supplier shall create a Bundle Resource of type “history” that is
entry\[1\] in the message Bundle. The history Bundle Resource shall be
constrained as described the [History Bundle Profile for PMIR](StructureDefinition-IHE.PMIR.Bundle.History.html). The entry shall
contain unique Patient Resource(s) that have been successfully created,
updated, or deleted on the Supplier. Unsuccessful changes are not
included.

###### 2:3.93.4.1.2.4 FHIR History Bundle entry Constraints for Merge

When a merge is needed, the Patient Resource to be deprecated shall be
included in the history Bundle.`entry` and shall be constrained as described in
the [Merged Patient Profile for PMIR](StructureDefinition-IHE.PMIR.Patient.Merge.html)
and the `entry.request.method` shall be `PUT`.

###### 2:3.93.4.1.2.5 FHIR Patient Resource Constraints for Related Person

When a Patient needs to be associated to a related person (such as a
mother to a newborn), the Patient Resource of the patient master
identity shall be constrained as described in the [Patient for Related Person Profile for PMIR](StructureDefinition-IHE.PMIR.Patient.Related.html).

For guidance on mother and newborn relationships, see
<https://www.hl7.org/fhir/R4/patient.html#maternity>.


###### 2:3.93.4.1.2.6 Example FHIR Bundles

The [PMIR Message Bundle Merge Example](Bundle-ex-PMIRBundleMerge.html) shows a
Bundle including Patient 123 being replaced by Patient 456 with no patient identity
changes made to the surviving patient identity.

The [PMIR Message Bundle Create Example](Bundle-ex-PMIRBundleCreate.html) shows
two new patients being created.

The [PMIR Message Bundle Update Example](Bundle-ex-PMIRBundleUpdate.html) shows
Patient 111 being updated.

The [PMIR Message Bundle Delete Example](Bundle-ex-PMIRBundleDelete.html) shows
Patient 111 being deleted.

##### 2:3.93.4.1.3 Expected Actions

A Patient Identity Registry shall accept the message and return a Mobile
Patient Identity Feed Response message (Section 2:3.93.4.2) and shall:

- **Create:** create Patient Resources when a create is sent. The
  Patient Identity Registry shall persist Patient Master Identities
  from the Master Patient Identification Domain. This Domain is
  represented by the base URL of the Patient Identity Registry.

- **Update:** persist updates to Patient Resources.

- **Delete:** See Section 2:3.93.4.1.3.1.

- **Merge:** deprecate the Patient Resource when the message includes
  a replaced-by link.type. The Patient Identity Registry shall set the
  deprecated Patient active to “false” and include a link with type
  set to “replaced-by” and other set to the surviving Patient. See
  Section 2:3.93.4.1.3.1.

- **Unmerge:** not supported by this transaction. When a Patient
  Identity Registry receives a Patient Resource where a link.type of
  “replaced-by” has been removed (i.e., an attempt to unmerge), it
  shall return a correlated entry.response.code of 405, unless local
  policy allows unmerge.

A Patient Identity Consumer shall accept the message and return a Mobile
Patient Identity Feed Response message (Section 2:3.93.4.2) and:

- **Create, Update, Delete, Merge:** will process the feed according
  to its application capabilities. IHE profiles that use this
  transaction, e.g., MHDS, may provide additional requirements such as
  updating the data the Patient Identity Consumer is managing.

###### *2:3.93.4.1.3.1* Post Merge/Delete Expectations

Based upon policy, a Patient Identity Registry, when performing a GET on
the deprecated or deleted Patient Resource Id (e.g., GET
\[base\]/Patient/pat01), shall return:

- 200 OK, and return the deprecated Patient which is now marked as
  inactive, or

- 404 Not Found

Based up policy, a Patient Identity Registry, when performing a SEARCH
by the deprecated or deleted Patient Resource Id (e.g., GET
\[base\]/Patient?\_id=pat01), shall return:

- 200 OK, and return a Bundle with the inactive patient which is
  marked as inactive, or

- 200 OK, and return a Bundle with no patient resource, or

- If merged, 200 OK, and return a Bundle with both the target and old
  patient resources

#### 2:3.93.4.2 Mobile Patient Identity Feed Response

##### 2:3.93.4.2.1 Trigger Events

A Consumer sends the Mobile Patient Identity Feed Response to the
Supplier when the Feed Request Message is fully processed.

##### 2:3.93.4.2.2 Message Semantics

A Consumer responds to the Mobile Patient Identity Feed Request with an
HTTP Status of 2xx with a Bundle Resource with the type set to “message”
and one entry that is a MessageHeader Resource that reports the outcome
of processing the Mobile Patient Identity Feed, or an error code, 4xx or
5xx.

##### 2:3.93.4.2.3 Expected Actions

The Supplier receives the response and continues with workflow
appropriate to success or failure as indicated in the Mobile Patient
Identity Feed Response.

### 2:3.93.5 Security Considerations

See [ITI TF-1: 49.5](volume-1.html#1495-pmir-security-considerations) for security considerations for the PMIR Profile.

See [ITI TF-2: Appendix Z.8](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations) for common mobile security considerations.

The Mobile Patient Identity Feed transaction should have both server
authentication and client authentication, so that the client knows that
the feed is going to the correct destination (server) and that the
destination (server) knows the authenticity of the source (client). The
content needs to be protected against integrity failures, and
confidentiality failures. The common use of https, with server-side
authentication, can address most of these requirements, however common
https does not address client authentication. For this client
authentication function, one could either use the
mutual-authenticated-TLS found in ATNA, or OAuth mechanism found in IUA.
Other solutions can be used as appropriate agreement between client and
server.

#### 2:3.93.5.1 Security Audit Considerations

The Mobile Patient Identity Feed transaction is a Patient Record Message
event as defined in [ITI TF-2: 3.20.4.1.1.1-1](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html#3.20.4.1.1.1).

Note that the same audit message is recorded by both Supplier and
Consumer. The difference being the Audit Source element. Both sides
record to show consistency between message sent by the Supplier and
action taken at the Consumer.

The actors involved shall record audit events according to the
[Audit Event for Mobile Patient Identity Feed by the Supplier](StructureDefinition-IHE.PMIR.Feed.Audit.Supplier.html)
and [Audit Event for Mobile Patient Identity Feed by the Consumer](StructureDefinition-IHE.PMIR.Feed.Audit.Consumer.html).

##### 2:3.93.5.1.1 Supplier audit message:

This table is being superseded by the [Audit Event for Mobile Patient Identity Feed by the Supplier](StructureDefinition-IHE.PMIR.Feed.Audit.Supplier.html)
and will be removed.

<table class="grid table-striped">
<tbody>
<tr>
<th></th>
<th>Field Name</th>
<th>Opt</th>
<th>Value Constraints</th>
</tr>
<tr>
<th rowspan="5"><p>Event</p>
<p><strong>AuditMessage/<br />
EventIdentification</strong></p></th>
<td>EventID</td>
<td>M</td>
<td>EV(110110, DICOM, “Patient Record”)</td>
</tr>
<tr>
<td>EventActionCode</td>
<td>M</td>
<td>EV(message, http://hl7.org/fhir/bundle-type, “message” )</td>
</tr>
<tr>
<td><em>EventDateTime</em></td>
<td><em>M</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>EventOutcomeIndicator</em></td>
<td><em>M</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td>EventTypeCode</td>
<td>M</td>
<td>EV(“ITI-93”, “IHE Transactions”, “Mobile Patient Identity Feed”)</td>
</tr>
<tr>
<td colspan="4">Source (Supplier) (1)</td>
</tr>
<tr>
<td colspan="4">Destination (Consumer) (1)</td>
</tr>
<tr>
<td colspan="4">Audit Source (Supplier) (1)</td>
</tr>
<tr>
<td colspan="4">Patient (1..N) Patient Identities in the message</td>
</tr>
<tr>
<td colspan="4">Message Identity (1)</td>
</tr>
<tr>
<th colspan="4">
Where:
</th>
</tr>
<tr>
<th rowspan="7"><p>Source</p>
<p><strong>AuditMessage/<br />
ActiveParticipant</strong></p></th>
<td><em>UserID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>AlternativeUserID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>UserName</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>UserIsRequestor</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td>RoleIDCode</td>
<td>M</td>
<td>EV(110153, DCM, “Source”)</td>
</tr>
<tr>
<td><em>NetworkAccessPointTypeCode</em></td>
<td><em>M</em></td>
<td>“1” for machine (DNS) name, “2” for IP address</td>
</tr>
<tr>
<td><em>NetworkAccessPointID</em></td>
<td><em>M</em></td>
<td>The machine name or IP address.</td>
</tr>
<tr>
<th rowspan="7"><p>Destination</p>
<p><strong>AuditMessage/<br />
ActiveParticipant</strong></p></th>
<td>UserID</td>
<td>M</td>
<td>http endpoint URI.</td>
</tr>
<tr>
<td><em>AlternativeUserID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>UserName</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>UserIsRequestor</em></td>
<td><em>M</em></td>
<td><em>“false”</em></td>
</tr>
<tr>
<td>RoleIDCode</td>
<td>M</td>
<td>EV(110152, DCM, “Destination”)</td>
</tr>
<tr>
<td><em>NetworkAccessPointTypeCode</em></td>
<td><em>M</em></td>
<td>“1” for machine (DNS) name, “2” for IP address</td>
</tr>
<tr>
<td><em>NetworkAccessPointID</em></td>
<td><em>M</em></td>
<td>The machine name or IP address.</td>
</tr>
<tr>
<th rowspan="3"><p>Audit Source</p>
<p><strong>AuditMessage/<br />
AuditSourceIdentification</strong></p></th>
<td><em>AuditSourceID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>AuditEnterpriseSiteID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>AuditSourceTypeCode</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<th rowspan="9"><p>Patient</p>
<p><strong>(AuditMessage/<br />
ParticipantObjectIdentification)</strong></p>
<p><strong>(1..N)</strong></p></th>
<td>ParticipantObjectTypeCode</td>
<td>M</td>
<td>“1” (Person)</td>
</tr>
<tr>
<td>ParticipantObjectTypeCodeRole</td>
<td>M</td>
<td>“1” (Patient)</td>
</tr>
<tr>
<td><em>ParticipantObjectDataLifeCycle</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectIDTypeCode</em></td>
<td><em>M</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectSensitivity</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td>ParticipantObjectID</td>
<td>M</td>
<td>The Patient._id value</td>
</tr>
<tr>
<td><em>ParticipantObjectName</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectQuery</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectDetail</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<th rowspan="9"><p>Message Identity</p>
<p><strong>(AuditMessage/<br />
ParticipantObjectIdentification)</strong></p></th>
<td>ParticipantObjectTypeCode</td>
<td>M</td>
<td>EV(MessageHeader, http://hl7.org/fhir/resource-types, “MessageHeader)</td>
</tr>
<tr>
<td><em>ParticipantObjectTypeCodeRole</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectDataLifeCycle</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectIDTypeCode</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectSensitivity</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td>ParticipantObjectID</td>
<td>M</td>
<td>MessageHeader._id value</td>
</tr>
<tr>
<td>ParticipantObjectName</td>
<td>M</td>
<td>MessageHeader.eventUri value</td>
</tr>
<tr>
<td><em>ParticipantObjectQuery</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectDetail</em></td>
<td><em>U</em></td>
<td><em>not specialized </em></td>
</tr>
</tbody>
</table>

##### 2:3.93.5.1.2 Consumer audit message:

This table is being superseded by the [Audit Event for Mobile Patient Identity Feed by the Consumer](StructureDefinition-IHE.PMIR.Feed.Audit.Consumer.html)
and will be removed.

<table class="grid table-striped">
<tbody>
<tr>
<th></th>
<th>Field Name</th>
<th>Opt</th>
<th>Value Constraints</th>
</tr>
<tr>
<th rowspan="5"><p>Event</p>
<p><strong>AuditMessage/<br />
EventIdentification</strong></p></th>
<td>EventID</td>
<td>M</td>
<td>EV(110110, DICOM, “Patient Record”)</td>
</tr>
<tr>
<td>EventActionCode</td>
<td>M</td>
<td>EV(message, http://hl7.org/fhir/bundle-type, “message” )</td>
</tr>
<tr>
<td><em>EventDateTime</em></td>
<td><em>M</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>EventOutcomeIndicator</em></td>
<td><em>M</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td>EventTypeCode</td>
<td>M</td>
<td>EV(“ITI-93”, “IHE Transactions”, “Mobile Patient Identity Feed”)</td>
</tr>
<tr>
<td colspan="4">Source (Supplier) (1)</td>
</tr>
<tr>
<td colspan="4">Destination (Consumer) (1)</td>
</tr>
<tr>
<td colspan="4">Audit Source (Consumer) (1)</td>
</tr>
<tr>
<td colspan="4">Patient (1..N) Patient Identities in the message</td>
</tr>
<tr>
<td colspan="4">Message Identity (1)</td>
</tr>
<tr>
<td colspan="4">
Where:
</td>
</tr>
<tr>
<th rowspan="7"><p>Source</p>
<p><strong>AuditMessage/<br />
ActiveParticipant</strong></p></th>
<td><em>UserID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>AlternativeUserID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>UserName</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>UserIsRequestor</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td>RoleIDCode</td>
<td>M</td>
<td>EV(110153, DCM, “Source”)</td>
</tr>
<tr>
<td><em>NetworkAccessPointTypeCode</em></td>
<td><em>M</em></td>
<td>“1” for machine (DNS) name, “2” for IP address</td>
</tr>
<tr>
<td><em>NetworkAccessPointID</em></td>
<td><em>M</em></td>
<td>The machine name or IP address.</td>
</tr>

<tr>
<th rowspan="7"><p>Destination</p>
<p><strong>AuditMessage/<br />
ActiveParticipant</strong></p></th>
<td>UserID</td>
<td>M</td>
<td>http endpoint URI.</td>
</tr>
<tr>
<td><em>AlternativeUserID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>UserName</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>UserIsRequestor</em></td>
<td><em>M</em></td>
<td><em>“false”</em></td>
</tr>
<tr>
<td>RoleIDCode</td>
<td>M</td>
<td>EV(110152, DCM, “Destination”)</td>
</tr>
<tr>
<td><em>NetworkAccessPointTypeCode</em></td>
<td><em>M</em></td>
<td>“1” for machine (DNS) name, “2” for IP address</td>
</tr>
<tr>
<td><em>NetworkAccessPointID</em></td>
<td><em>M</em></td>
<td>The machine name or IP address.</td>
</tr>

<tr>
<th rowspan="3"><p>Audit Source</p>
<p><strong>AuditMessage/<br />
AuditSourceIdentification</strong></p></th>
<td><em>AuditSourceID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>AuditEnterpriseSiteID</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>AuditSourceTypeCode</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>

<tr>
<th rowspan="9"><p>Patient</p>
<p><strong>(AuditMessage/<br />
ParticipantObjectIdentification)</strong></p>
<p><strong>(1..N)</strong></p></th>
<td>ParticipantObjectTypeCode</td>
<td>M</td>
<td>“1” (Person)</td>
</tr>
<tr>
<td>ParticipantObjectTypeCodeRole</td>
<td>M</td>
<td>“1” (Patient)</td>
</tr>
<tr>
<td><em>ParticipantObjectDataLifeCycle</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectIDTypeCode</em></td>
<td><em>M</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectSensitivity</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td>ParticipantObjectID</td>
<td>M</td>
<td>The Patient._id value</td>
</tr>
<tr>
<td><em>ParticipantObjectName</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectQuery</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectDetail</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>

<tr>
<th rowspan="9"><p>Message Identity</p>
<p><strong>(AuditMessage/<br />
ParticipantObjectIdentification)</strong></p></th>
<td>ParticipantObjectTypeCode</td>
<td>M</td>
<td>EV(MessageHeader, http://hl7.org/fhir/resource-types, “MessageHeader)</td>
</tr>
<tr>
<td><em>ParticipantObjectTypeCodeRole</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectDataLifeCycle</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectIDTypeCode</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectSensitivity</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td>ParticipantObjectID</td>
<td>M</td>
<td>MessageHeader._id value</td>
</tr>
<tr>
<td>ParticipantObjectName</td>
<td>M</td>
<td>MessageHeader.eventUri value</td>
</tr>
<tr>
<td><em>ParticipantObjectQuery</em></td>
<td><em>U</em></td>
<td><em>not specialized</em></td>
</tr>
<tr>
<td><em>ParticipantObjectDetail</em></td>
<td><em>U</em></td>
<td><em>not specialized </em></td>
</tr>
</tbody>
</table>