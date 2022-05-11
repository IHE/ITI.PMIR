<div markdown="1" class="stu-note">
This section contains modifications to other IHE publications and profiles, and is not a part of the PMIR profile. The content here will be incorporated into the target narrative at a future time, usually when PMIR goes final-text.
</div>

## IHE Technical Frameworks General Introduction Appendix A – Actor Summary Definitions

|------------------------------------------------|
| Editor, add the following new or modified actors to the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}

| Actor Name                | Definition |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Patient Identity Registry   | Receives patient identity updates, manages patient master identities, sends changes, and provides a searchable repository of patient identity information. |
| Patient Identity Subscriber | Sends subscription requests for patient identity updates. |
| Patient Identity Consumer   | Receives patient identity updates.|
{:.grid .table-striped}


## IHE Technical Frameworks General Introduction Appendix B – Transaction Summary Definitions

|------------------------------------------------|
| Editor, add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}

| Transaction Name and Number           | Definition |
|---------------------------------------|-------------------------------------------------------------------------------------------------------|                                          |
| Mobile Patient Identity Feed \[ITI-93\] | Notifications of all events related to patient identities (creation, update, link, etc.). |
| Subscribe to Patient Updates \[ITI-94\] | Subscription to notifications about events impacting patient identities (creation, update, link, etc.). |
{:.grid .table-striped}

## 3.78.2 Actor Roles

|------------------------------------------------|
| Editor, replace Section 3.78.2 with the following. (Note: This section is currently in the PDQm Trial Implementation Supplement.) |
{:.grid .bg-info}

**Table 3.78.2-1: Actor Roles**

| -------------- | --------------------- |
| **Role:** | Patient Demographics Consumer:<br />Requests a list of patients matching the supplied set of demographics criteria (example: ID or Name) from the Patient Demographics Supplier. The Patient Demographics Consumer populates its attributes with demographic information received from the Patient Demographics Supplier. |
| **Actor(s):** | The following actors may play the role of Patient Demographics Consumer:<br />*Patient Demographics Consumer* |
| **Role:** | Patient Demographics Supplier:<br />Returns demographic information for all patients matching the demographics criteria provided by the Patient Demographics Consumer. |
| **Actor(s):** | The following actors may play the role of Patient Demographics Supplier:<br />*Patient Demographics Supplier*<br />*Patient Identity Registry* |
{:.grid .table-striped}

## 3.83.2 Actor Roles

|------------------------------------------------|
| Editor, Replace Section 3.83.2 with the following. (Note: This section is currently in the PIXm Trial Implementation Supplement.) | 
{:.grid .bg-info}

**Table 3.83.2-1: Actor Roles**

| -------------- | --------------------- |
| **Role:** | Patient Identifier Cross-reference Consumer:<br />Requests, from the Patient Identifier Cross-reference Manager, a list of patient identifiers matching the supplied Patient Identifier. |
| **Actor(s):** | The following actors may play the role of Patient Identifier Cross-reference Consumer:<br />*Patient Identifier Cross-reference Consumer* |
| **Role:** | Patient Identifier Cross-reference Manager:<br />Returns Cross-referenced Patient Identifiers for the patient that cross-matches the Patient Identifier criteria provided by the Patient Identifier Cross-reference Consumer. |
| **Actor(s):** | The following actors may play the role of Patient Identifier Cross-reference Manager:<br />*Patient Identifier Cross-reference Manager*<br />*Patient Identity Registry* |
{:.grid .table-striped}
