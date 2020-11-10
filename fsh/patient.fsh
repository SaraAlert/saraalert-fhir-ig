Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient

// Sara Alert Patient profile.
Profile: SaraAlertPatient
Parent: USCorePatient
Id: sara-alert-patient
Title: "Sara Alert Patient Profile"
Description: "Sara Alert outputs additional extensions on Patient resources"
* extension contains 
  preferred-contact-method named preferred-contact-method 0..1 MS and
  preferred-contact-time named preferred-contact-time 0..1 MS and
  symptom-onset-date named symptom-onset-date 0..1 MS and
  last-exposure-date named last-exposure-date 0..1 MS and
  isolation named isolation 0..1 MS and
  full-assigned-jurisdiction-path named full-assigned-jurisdiction-path 0..1 MS
* active MS
* name MS
* telecom MS
* birthDate MS
* address MS
* communication MS

// Preferred Contact Method Extension
Extension: PreferredContactMethod
Id: preferred-contact-method
Title: "Preferred Contact Method"
Description: "The monitorees Sara Alert preferred contact method (options are: `E-mailed Web Link`, `SMS Texted Weblink`, `Telephone call`, and `SMS Text-message`)."
* value[x] only string

// Preferred Contact Time Extension
Extension: PreferredContactTime
Id: preferred-contact-time
Title: "Preferred Contact Time"
Description: "The monitorees Sara Alert preferred contact time (options are: `Morning`, `Afternoon`, `Evening`)."
* value[x] only string

// Symptom Onset Date Extension
Extension: SymptomOnsetDate
Id: symptom-onset-date
Title: "Symptom Onset Date"
Description: "When the monitoree's first symptoms appeared for use in the Sara Alert isolation workflow."
* value[x] only date

// Last Exposure Date Extension
Extension: LastExposureDate
Id: last-exposure-date
Title: "Last Exposure Date"
Description: "When the monitoree's last exposure occurred for use in the Sara Alert exposure workflow."
* value[x] only date

// Isolation Extension
Extension: Isolation
Id: isolation
Title: "Isolation"
Description: "If the monitoree should be in the isolation workflow (omitting this extension defaults this value to false, leaving the monitoree in the exposure workflow."
* value[x] only boolean

// Full Assigned Jurisdiction Path
Extension: FullAssignedJurisdictionPath
Id: full-assigned-jurisdiction-path
Title: "Full Assigned Jurisdiction Path"
Description: "Represents the jurisdiction in which this monitoree is enrolled."
* value[x] only string
