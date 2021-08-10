// Sara Alert QuestionnaireResponse profile.
Profile: SaraAlertQuestionnaireResponse
Parent: QuestionnaireResponse
Id: sara-alert-questionnaire-response
Title: "Sara Alert QuestionnaireResponse Profile"
Description: "The Sara Alert QuestionnaireResponse profile represents a monitoree daily report."
* meta.lastUpdated 1..1 MS
* status 1..1 MS
* subject only Reference(SaraAlertPatient)
* subject 1..1 MS
* item 1..* MS
* item.linkId 1..1 MS
* item.text 1..1 MS
* item.answer 1..1 MS
* item.answer.value[x] only boolean or string
* item.answer.value[x] 1..1 MS
* extension contains
  created-at named created-at 0..1 MS and
  who-reported named who-reported 0..1 MS and
  symptomatic named symptomatic 0..1 MS


// Who Reported
Extension: WhoReported
Id: who-reported
Title: "Who Reported"
Description: "System assigned value for the monitoree or user that submitted a report. This field is read-only."
* value[x] only string

Extension: Symptomatic
Id: symptomatic
Title: "Symptomatic"
Description: "This field indicates if the monitoree has reported symptoms that need review by a public health user. This field is read-only."
* value[x] only boolean