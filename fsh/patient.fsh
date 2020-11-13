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
  full-assigned-jurisdiction-path named full-assigned-jurisdiction-path 0..1 MS and
  monitoring-plan named monitoring-plan 0..1 MS and
  assigned-user named assigned-user 0..1 MS and
  additional-planned-travel-start-date named additional-planned-travel-start-date 0..1 MS and
  port-of-origin named port-of-origin 0..1 MS and
  departure-date named departure-date 0..1 MS and
  flight-or-vessel-number named flight-or-vessel-number 0..1 MS and
  flight-or-vessel-carrier named flight-or-vessel-carrier 0..1 MS and
  arrival-date named arrival-date 0..1 MS and
  exposure-notes named exposure-notes 0..1 MS and
  travel-notes named travel-notes 0..1 MS and
  additional-planned-travel-notes named additional-planned-travel-notes 0..1 MS
* telecom.extension contains phone-type named phone-type 0..1 MS
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
Description: "Represents the form in which the monitoree receives their daily symptom reports (options are: `E-mailed Web Link`, `SMS Texted Weblink`, `Telephone call`, and `SMS Text-message`)."
* value[x] only string

// Preferred Contact Time Extension
Extension: PreferredContactTime
Id: preferred-contact-time
Title: "Preferred Contact Time"
Description: "Represents the time period that the system sends out symptom reports to a monitoree (options are: `Morning`, `Afternoon`, `Evening`)."
* value[x] only string

// Symptom Onset Date Extension
Extension: SymptomOnsetDate
Id: symptom-onset-date
Title: "Symptom Onset Date"
Description: "When the monitoree`s first symptoms appeared for use in the Sara Alert isolation workflow."
* value[x] only date

// Last Exposure Date Extension
Extension: LastExposureDate
Id: last-exposure-date
Title: "Last Exposure Date"
Description: "When the monitoree`s last exposure occurred for use in the Sara Alert exposure workflow."
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

// Monitoring Plan
Extension: MonitoringPlan
Id: monitoring-plan
Title: "Monitoring Plan"
Description: "Represents the monitoring approach selected by public health based on CDC or local guidance (options are: `None`, `Daily active monitoring`, `Self-monitoring with public health supervision`, `Self-monitoring with delegated supervision`, `Self-observation`)."
* value[x] only string

// Assigned User
Extension: AssignedUser
Id: assigned-user
Title: "Assigned User"
Description: "Represents the user or group within a jurisdiction responsible for monitoring a monitoree."
* value[x] only string

// Additional Planned Travel Start Date
Extension: AdditionalPlannedTravelStartDate
Id: additional-planned-travel-start-date
Title: "Additional Planned Travel Start Date"
Description: "Represents the date that the monitoree is planning to begin their additional travel."
* value[x] only date

// Port of Origin
Extension: PortOfOrigin
Id: port-of-origin
Title: "Port of Origin"
Description: "Represents the airport, station, or docking point that the monitoree traveled from."
* value[x] only string

// Departure Date
Extension: DepartureDate
Id: departure-date
Title: "Departure Date"
Description: "Represents the date that the monitoree traveled from the Port of Origin to the United States."
* value[x] only date

// Flight Or Vessel Number
Extension: FlightOrVesselNumber
Id: flight-or-vessel-number
Title: "Flight or Vessel Number"
Description: "Represents the plane, train, ship, or other vessel that the monitoree used to travel to their destination."
* value[x] only string

// Flight Or Vessel Carrier
Extension: FlightOrVesselCarrier
Id: flight-or-vessel-carrier
Title: "Flight or Vessel Carrier"
Description: "Represents the carrier, operating company, or provider of the flight or vessel."
* value[x] only string

// Arrival Date
Extension: ArrivalDate
Id: arrival-date
Title: "Arrival Date"
Description: "Represents when the monitoree entered the United States after travel."
* value[x] only date

// Exposure Notes
Extension: ExposureNotes
Id: exposure-notes
Title: "Exposure Notes"
Description: "Represents any additional notes about the monitoree’s exposure history or case information history. This can include details about the interaction with a known case, high risk activities, common exposure, etc."
* value[x] only string

// Travel Notes
Extension: TravelNotes
Id: travel-notes
Title: "Travel Notes"
Description: "Represents any additional notes about the monitoree’s travel history. This can include details about the nature of the trip, contact with anyone symptomatic, original country departed from, etc."
* value[x] only string

// Additional Planned Travel Notes
Extension: AdditionalPlannedTravelNotes
Id: additional-planned-travel-notes
Title: "Additional Planned Travel Notes"
Description: "Represents any additional notes about the monitoree’s planned travel. This can include details about the nature of the trip, planned social interaction, additional destinations, etc."
* value[x] only string

// Phone Type
Extension: PhoneType
Id: phone-type
Title: "Phone Type"
Description: "Represents the type of phone attached to the phone number. This field can be used to determine a monitoree’s ability to receive SMS Texted Weblink, Telephone call, or SMS Text-message during the selection of Preferred Reporting Method (options are: `Smartphone`, `Landline`, `Plain Cell`)."
* value[x] only string
