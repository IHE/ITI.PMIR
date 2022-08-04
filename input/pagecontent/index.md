
The Patient Master Identity Registry (PMIR) Profile supports the creating, updating and deprecating of patient master identity information about a subject of care, as well as subscribing to changes to the patient master identity, using the HL7 FHIR standard resources and RESTful transactions. In PMIR, “patient identity” information includes all information found in the FHIR Patient Resource such as identifier, name, phone, gender, birth date, address, marital status, photo, others to contact, preference for language, general practitioner, and links to other instances of identities. The “patient master identity” is the dominant patient identity managed centrally among many participating organizations (a.k.a., “Golden Patient Identity”).

Beyond the basic create, retrieve, update, and delete transaction set, this profile addresses important patient safety issues related to cases where there are two or more patient master identities that have been established for the same person, thus it is not clear which identity is the “true” one. There is also a risk that health data (possibly conflicting) may be associated with each identity – and these disparate data, together, may need to be reconciled before a fully and accurate “health picture” can be developed for this person. These situations represent patient safety risks. This profile addresses how these multiple patient master identities can be merged into a single patient master identity, and how this merge flows down to data custodians so that they take appropriate actions. It is outside the scope of this profile to define how references to the deprecated patient master identity from other data should be handled.

This profile is intended for FHIR-only configurations without other underlying standards for patient master identity management. The FHIR message pattern was chosen because it fits well into the subscription notification model.

<div markdown="1" class="stu-note">

| [Significant Changes, Open, and Closed Issues](issues.html) |
{: .grid}

</div>


### Organization of This Guide
This guide is organized into four main sections:

1. Volume 1: Profiles
   1. [PMIR Introduction](volume-1.html)
   2. [PMIR Actors, Transactions, and Content Modules](volume-1.html#1491-pmir-actors-transactions-and-content-modules)
   3. [PMIR Actor Options](volume-1.html#1492-pmir-actor-options)
   4. [PMIR Required Actor Groupings](volume-1.html#1493-pmir-required-actor-groupings)
   5. [PMIR Overview](volume-1.html#1494-pmir-overview)
   6. [PMIR Security Considerations](volume-1.html#1495-pmir-security-considerations)
   7. [PMIR Cross Profile Considerations](volume-1.html#1496-pmir-cross-profile-considerations)

2. Volume 2: Transaction Detail
   1. [Mobile Patient Identity Feed \[ITI-93\]](ITI-93.html)
   2. [Subscribe to Patient Updates \[ITI-94\]](ITI-94.html)

3. [Test Plan](testplan.html)

4. [Changes to other Profiles](other.html)


Click on any of the links above, navigate the contents using the [table of contents](toc.html), or if you are looking for a specific artifact, check out the [artifacts](artifacts.html).

### Conformance Expectations

IHE uses the normative words: Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Must Support

The use of ```mustSupport``` in StructureDefinition profiles equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

mustSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor shall populate the elements marked with MustSupport if the concept is supported by the actor, a value exists, and security and consent rules permit. 
The consuming actors should handle these elements being populated or being absent/empty. 
Note that sometimes mustSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.

### Download 

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on [IHE GitHub](https://github.com/IHE/ITI.PMIR).
