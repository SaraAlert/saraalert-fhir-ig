// Sara Alert Observation profile.
Profile: SaraAlertObservation
Parent: Observation
Id: sara-alert-observation
Title: "Sara Alert Observation Profile"
Description: "The Sara Alert Observation profile represents a monitoree lab result."
* meta.lastUpdated 1..1 MS
* status 1..1 MS
* subject only Reference(SaraAlertPatient)
* subject 1..1 MS
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
* value[x] only string
* valueString 1..1 MS
