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