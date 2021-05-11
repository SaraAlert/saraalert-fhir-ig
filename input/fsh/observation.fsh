// Sara Alert Observation profile.
Profile: SaraAlertObservation
Parent: Observation
Id: sara-alert-observation
Title: "Sara Alert Observation Profile"
Description: "The Sara Alert Observation profile represents a monitoree lab result."
* meta.lastUpdated 1..1 MS
* status MS
* status = #final
* category 1..1 MS
* category = CAT#laboratory
* code 1..1 MS
* code from SaraAlertLabType
* subject 1..1 MS
* subject only Reference(SaraAlertPatient)
* effective[x] only dateTime
* effectiveDateTime MS
* value[x] only CodeableConcept
* valueCodeableConcept MS
* valueCodeableConcept from SaraAlertLabResult (required)
* extension contains report-date named report-date 0..1 MS

// Preferred Contact Method Extension
Extension: ReportDate
Id: report-date
Title: "Report Date"
Description: "Represents the report date for a lab result."
* value[x] only date