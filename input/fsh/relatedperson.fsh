// Sara Alert RelatedPerson.
Profile: SaraAlertRelatedPerson
Parent: RelatedPerson
Id: sara-alert-related-person
Title: "Sara Alert RelatedPerson Profile"
Description: "The Sara Alert RelatedPerson profile represents a close contact of a monitoree."
* telecom 1..2 MS
* name 1..1 MS
* name obeys sara-3
* name.given 0..1
* name.given ^short = "First name"
* patient MS
* patient.reference 1..1
* extension contains
  last-date-of-exposure named last-date-of-exposure 0..1 MS and
  assigned-user named assigned-user 0..1 MS and
  notes named notes 0..1 MS and
  contact-attempts named contact-attempts 0..1 MS and
  enrolled-patient named enrolled-patient 0..1 MS

// Notes Extension
Extension: Notes
Id: notes
Title: "Notes"
Description: "Represents general notes used to describe a close contact of a monitoree."
* value[x] only string

// Contact Attempts Extension
Extension: ContactAttempts
Id: contact-attempts
Title: "Contact Attempts"
Description: "Represents the number of times that a close contact of a monitoree has been contacted."
* value[x] only positiveInt

// Enrolled Patient Extension
Extension: EnrolledPatient
Id: enrolled-patient
Title: "Enrolled Patient"
Description: "References the monitoree that corresponds to the close contact, if such a monitoree exists."
* value[x] only Reference
* valueReference only Reference(Patient)
* valueReference.reference 1..1 MS

// Invariant for Continuous Exposure
Invariant:  sara-3
Description: "At least one name should be given for identification."
Expression: "(family | given).exists()"
Severity:   #error
