Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Alias: $gender-identity = http://hl7.org/fhir/StructureDefinition/patient-genderIdentity

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
  last-date-of-exposure named last-date-of-exposure 0..1 MS and
  isolation named isolation 0..1 MS and
  full-assigned-jurisdiction-path named full-assigned-jurisdiction-path 0..1 MS and
  monitoring-plan named monitoring-plan 0..1 MS and
  assigned-user named assigned-user 0..1 MS and
  additional-planned-travel-start-date named additional-planned-travel-start-date 0..1 MS and
  additional-planned-travel-end-date named additional-planned-travel-end-date 0..1 MS and
  additional-planned-travel-destination named additional-planned-travel-destination 0..1 MS and
  additional-planned-travel-destination-state named additional-planned-travel-destination-state 0..1 MS and
  additional-planned-travel-destination-country named additional-planned-travel-destination-country 0..1 MS and
  additional-planned-travel-port-of-departure named additional-planned-travel-port-of-departure 0..1 MS and
  additional-planned-travel-type named additional-planned-travel-type 0..1 MS and
  port-of-origin named port-of-origin 0..1 MS and
  port-of-entry-into-usa named port-of-entry-into-usa 0..1 MS and
  date-of-departure named date-of-departure 0..1 MS and
  flight-or-vessel-number named flight-or-vessel-number 0..1 MS and
  flight-or-vessel-carrier named flight-or-vessel-carrier 0..1 MS and
  date-of-arrival named date-of-arrival 0..1 MS and
  exposure-notes named exposure-notes 0..1 MS and
  travel-related-notes named travel-related-notes 0..1 MS and
  additional-planned-travel-notes named additional-planned-travel-notes 0..1 MS and
  continuous-exposure named continuous-exposure 0..1 MS and
  follow-up-reason named follow-up-reason 0..1 MS and
  follow-up-note named follow-up-note 0..1 MS and
  exposure-risk-assessment named exposure-risk-assessment 0..1 MS and
  public-health-action named public-health-action 0..1 MS and
  extended-isolation named extended-isolation 0..1 MS and
  potential-exposure-location named potential-exposure-location 0..1 MS and
  potential-exposure-country named potential-exposure-country 0..1 MS and
  end-of-monitoring named end-of-monitoring 0..1 MS and
  expected-purge-date named expected-purge-date 0..1 MS and
  reason-for-closure named reason-for-closure 0..1 MS and
  case-status named case-status 0..1 MS and
  closed-at named closed-at 0..1 MS and
  $gender-identity named gender-identity 0..1 MS and
  sexual-orientation named sexual-orientation 0..1 MS and
  head-of-household named head-of-household 0..1 MS and
  id-of-reporter named id-of-reporter 0..1 MS and
  last-assessment-reminder-sent named last-assessment-reminder-sent 0..1 MS and
  paused-notifications named paused-notifications 0..1 MS and
  status named status 0..1 MS and
  user-defined-symptom-onset named user-defined-symptom-onset 0..1 MS and
  transfer named transfer 0..* MS and
  exposure-risk-factors named exposure-risk-factors 0..1 MS and
  source-of-report named source-of-report 0..1 MS
* obeys sara-1
* obeys sara-2
* obeys sara-3
* telecom.extension contains phone-type named phone-type 0..1 MS
* active MS
* name MS
* telecom MS
* birthDate MS
* address MS
* address ^slicing.discriminator.type = #value
* address ^slicing.discriminator.path = "extension('http://saraalert.org/SaraAlert/StructureDefinition/address-type').value"
* address ^slicing.rules = #open
* address ^slicing.description = "Slice to distinguish a Foreign Address (outside of the USA)."
* address contains
  ForeignAddress 0..1 MS and
  MonitoredAddress 0..1 MS and
  ForeignMonitoredAddress 0..1 MS
* address[ForeignAddress].extension contains address-type named address-type 1..1 MS
* address[ForeignAddress].extension[address-type].valueString = "Foreign"
* address[MonitoredAddress].extension contains address-type named address-type 1..1 MS
* address[MonitoredAddress].extension[address-type].valueString = "Monitored"
* address[ForeignMonitoredAddress].extension contains address-type named address-type 1..1 MS
* address[ForeignMonitoredAddress].extension[address-type].valueString = "ForeignMonitored"
* communication MS
* communication.language from SaraAlertLanguage (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice to distinguish the identifier for State/Local ID."
* identifier contains
  StateLocalId 0..1 MS and
  CDCId 0..1 MS and
  NNDSSId 0..1 MS
* identifier[StateLocalId].system = "http://saraalert.org/SaraAlert/state-local-id"
* identifier[StateLocalId] ^short = "The State/Local ID assigned by the state or jurisdiction’s monitoring policies."
* identifier[StateLocalId] ^comment = "The State/Local ID is the variable to represent the assigned state or local ID of the monitoree. This field is determined from the assigned state or jurisdiction’s monitoring policies."
* identifier[CDCId].system = "http://saraalert.org/SaraAlert/cdc-id"
* identifier[CDCId] ^short = "The identifier to represent the Centers for Disease Control and Prevention assigned ID of the monitoree. "
* identifier[CDCId] ^comment = "CDC ID is the variable to represent the Centers for Disease Control and Prevention assigned ID of the monitoree. This field is determined from CDC’s guidance."
* identifier[NNDSSId].system = "http://saraalert.org/SaraAlert/nndss-id"
* identifier[NNDSSId] ^short = "The assigned NNDSS ID or Case ID of the monitoree."
* identifier[NNDSSId] ^comment = "The National Notifiable Diseases Surveillance System (NNDSS) ID is the variable to represent the assigned NNDSS ID or Case ID of the monitoree. This field is determined from the assigned jurisdiction’s monitoring policies."

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

// Last Date of Exposure Extension
Extension: LastDateOfExposure
Id: last-date-of-exposure
Title: "Last Date of Exposure"
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
* value[x] only positiveInt

// Additional Planned Travel Start Date
Extension: AdditionalPlannedTravelStartDate
Id: additional-planned-travel-start-date
Title: "Additional Planned Travel Start Date"
Description: "Represents the date that the monitoree is planning to begin their additional travel."
* value[x] only date

// Additional Planned Travel End Date
Extension: AdditionalPlannedTravelEndDate
Id: additional-planned-travel-end-date
Title: "Additional Planned Travel End Date"
Description: "Represents the date that the monitoree is planning to end their additional travel. This field is read-only."
* value[x] only date

// Additional Planned Travel Destination
Extension: AdditionalPlannedTravelDestination
Id: additional-planned-travel-destination
Title: "Additional Planned Travel Destination"
Description: "Represents destination of the monitoree’s planned travel. This field is read-only."
* value[x] only string

// Additional Planned Travel Destination State
Extension: AdditionalPlannedTravelDestinationState
Id: additional-planned-travel-destination-state
Title: "Additional Planned Travel Destination State"
Description: "Represents destination state of the monitoree’s planned travel. This field is read-only."
* value[x] only string

// Additional Planned Travel Destination Country
Extension: AdditionalPlannedTravelDestinationCountry
Id: additional-planned-travel-destination-country
Title: "Additional Planned Travel Destination Country"
Description: "Represents destination country of the monitoree’s planned travel. This field is read-only."
* value[x] only string

// Additional Planned Travel Port of Departure
Extension: AdditionalPlannedTravelPortOfDeparture
Id: additional-planned-travel-port-of-departure
Title: "Additional Planned Travel Port of Departure"
Description: "Represents the airport, station, or docking point that the monitoree is planning to travel from. This field is read-only."
* value[x] only string

// Additional Planned Travel Type
Extension: AdditionalPlannedTravelType
Id: additional-planned-travel-type
Title: "Additional Planned Travel Type"
Description: "Represents type of additional planned travel the monitoree has reported (options are: `Domestic` and `International`). This field is read-only."
* value[x] only string

// Port of Origin
Extension: PortOfOrigin
Id: port-of-origin
Title: "Port of Origin"
Description: "Represents the airport, station, or docking point that the monitoree traveled from."
* value[x] only string

// Port of Entry into USA
Extension: PortOfEntryIntoUSA
Id: port-of-entry-into-usa
Title: "Port of Entry into USA"
Description: "Represents the U.S. airport, station, or docking point that the monitoree traveled to in order to enter the United States. This field is read-only."
* value[x] only string

// Date of Departure
Extension: DateOfDeparture
Id: date-of-departure
Title: "Date of Departure"
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

// Date of Arrival
Extension: DateOfArrival
Id: date-of-arrival
Title: "Date of Arrival"
Description: "Represents when the monitoree entered the United States after travel."
* value[x] only date

// Exposure Notes
Extension: ExposureNotes
Id: exposure-notes
Title: "Exposure Notes"
Description: "Represents any additional notes about the monitoree’s exposure history or case information history. This can include details about the interaction with a known case, high risk activities, common exposure, etc."
* value[x] only string

// Travel Related Notes
Extension: TravelRelatedNotes
Id: travel-related-notes
Title: "Travel Related Notes"
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

// Address Type
Extension: AddressType
Id: address-type
Title: "Address Type"
Description: "Indicates if a monitoree's address is within the USA, or outside of the USA (options are: `USA` and `Foreign`). The extension only has meaning when used on the 'Patient.address' element. If this extension is not present the address is assumed to be within the USA."
* value[x] only string

// Exposure Risk Assessment
Extension: ExposureRiskAssessment
Id: exposure-risk-assessment
Title: "Exposure Risk Assessment"
Description: "Indicates the risk assessment of a a monitoree's exposure to disease (options are: `High`, `Medium`, `Low`, `No Identified Risk`)."
* value[x] only string

// Public Health Action
Extension: PublicHealthAction
Id: public-health-action
Title: "Public Health Action"
Description: "Indicates the public health recommendation for a monitoree (options are: `None`, `Recommended medical evaluation of symptoms`, `Document results of medical evaluation`, `Recommended laboratory testing`)."
* value[x] only string

// Extended Isolation
Extension: ExtendedIsolation
Id: extended-isolation
Title: "Extended Isolation"
Description: "Represents a user-defined date that determines eligibility for a monitoree appearing on the Records Requiring Review linelist."
* value[x] only date

// Potential Exposure Location
Extension: PotentialExposureLocation
Id: potential-exposure-location
Title: "Potential Exposure Location"
Description: "Represents a description of the location where the monitoree was potentially last exposed to a case."
* value[x] only string

// Potential Exposure Country
Extension: PotentialExposureCountry
Id: potential-exposure-country
Title: "Potential Exposure Country"
Description: "Represents a description of the country where the monitoree was potentially last exposed to a case."
* value[x] only string

// End of Monitoring
Extension: EndOfMonitoring
Id: end-of-monitoring
Title: "End of Monitoring"
Description: "Represents the system calculated end of monitoring period. This field is read-only."
* value[x] only date

// Expected Purge Date
Extension: ExpectedPurgeDate
Id: expected-purge-date
Title: "Expected Purge Date"
Description: "Represents the date and time that the monitoree's identifiers will be eligible to be purged from the system. This field is read-only."
* value[x] only date

// Reason for Closure
Extension: ReasonForClosure
Id: reason-for-closure
Title: "Reason for Closure"
Description: "Represents the reason a monitoree was closed by the user or system. This field is read-only."
* value[x] only string

// Continuous Exposure
Extension: ContinuousExposure
Id: continuous-exposure
Title: "Continuous Exposure"
Description: "Indicates if a monitoree's exposure to one or more cases is ongoing. This type of exposure means there is no known 'Last Date of Exposure'"
* value[x] only boolean

// Follow-up Reason
Extension: FollowUpReason
Id: follow-up-reason
Title: "Follow-up Reason"
Description: "Specifies a reason to follow up on the monitoree (options are: `Deceased`, `Duplicate`, `High-Risk`, `Hospitalized`, `In Need of Follow-up`, `Lost to Follow-up`, `Needs Interpretation`, `Quality Assurance`, `Refused Active Monitoring`, and `Other`)."
* value[x] only string

// Follow-up Note
Extension: FollowUpNote
Id: follow-up-note
Title: "Follow-up Note"
Description: "Specifies additional details for the follow-up reason on the monitoree."
* value[x] only string

// Case Status
Extension: CaseStatus
Id: case-status
Title: "Case Status"
Description: "Represents if a monitoree meets a case definition (options are: `Confirmed`, `Probable`, `Suspect`, `Unknown`, and `Not a Case`). This field is read-only."
* value[x] only string

// Closed At
Extension: ClosedAt
Id: closed-at
Title: "Closed At"
Description: "Represents the date and time that a monitoree was manually closed by a user or automatically closed by the system. This field is read-only."
* value[x] only dateTime

// Head of Household
Extension: HeadOfHousehold
Id: head-of-household
Title: "Head of Household"
Description: "This field indicates if the monitoree is a head of household. This field is read-only."
* value[x] only boolean

// ID of Reporter
Extension: IDOfReporter
Id: id-of-reporter
Title: "ID of Reporter"
Description: "Represents the ID of the monitoree that is responsible of reporting on a monitoree’s behalf. This field is read-only."
* value[x] only positiveInt

// Last Assessment Reminder Sent
Extension: LastAssessmentReminderSent
Id: last-assessment-reminder-sent
Title: "Last Assessment Reminder Sent"
Description: "This field represents the date and time that a report reminder was last sent to a monitoree. This field is read-only."
* value[x] only dateTime

// Paused Notifications
Extension: PausedNotifications
Id: paused-notifications
Title: "Paused Notifications"
Description: "This field indicates if the monitoree has notifications paused. This field is read-only."
* value[x] only boolean

// Status
Extension: Status
Id: status
Title: "Status"
Description: """
For monitorees in the Exposure workflow, this field represents the line list, where the monitoree
is being monitored (options are: `asymptomatic`, `symptomatic`, `non reporting`, `under investigation = PUI`, and `closed`).

For monitorees in the Isolation workflow, this field represents the monitoree’s preliminarily met
recovery definition. If the monitoree has not met a preliminary recovery definition,
then this field indicates the line list where the monitoree is being monitored
(options are: `symp non test based`, `asymp non test based`, `test based`, `reporting`, `non reporting`, and `closed`).
This field is read-only.
"""
* value[x] only string

// User Defined Symptom Onset
Extension: UserDefinedSymptomOnset
Id: user-defined-symptom-onset
Title: "User Defined Symptom Onset"
Description: "This field indicates if a user manually defined symptom onset for the monitoree. This field is read-only."
* value[x] only boolean

// Transfer
Extension: Transfer
Id: transfer
Title: "Transfer"
Description: "Represents a transfer event involving the monitoree. This field is read-only."
* extension contains
  id 1..1 MS and
  updated-at 1..1 MS and
  created-at 1..1 MS and
  who-initiated-transfer 1..1 MS and
  from-jurisdiction 1..1 MS and
  to-jurisdiction 1..1 MS
* extension[id].value[x] only positiveInt
* extension[updated-at].value[x] only dateTime
* extension[created-at].value[x] only dateTime
* extension[who-initiated-transfer].value[x] only string
* extension[from-jurisdiction].value[x] only string
* extension[to-jurisdiction].value[x] only string

// Exposure Risk Factors
Extension: ExposureRiskFactors
Id: exposure-risk-factors
Title: "Exposure Risk Factors"
Description: "Represents the exposure risk factors for the monitoree. This field is read-only."
* extension contains
  contact-of-known-case named contact-of-own-case 1..1 MS and
  was-in-health-care-facility-with-known-cases named was-in-health-care-facility-with-known-cases 1..1 MS and
  laboratory-personnel named laboratory-personnel 1..1 MS and
  healthcare-personnel named healthcare-personnel 1..1 MS and
  member-of-a-common-exposure-cohort named member-of-a-common-exposure-cohort 1..1 MS and
  travel-from-affected-country-or-area named travel-from-affected-country-or-area 1..1 MS and
  crew-on-passenger-or-cargo-flight named crew-on-passenger-or-cargo-flight 1..1 MS

// Contact Of Known Case
Extension: ContactOfKnownCase
Id: contact-of-known-case
Title: "Contact Of Known Case"
Description: "Represents whether or not a monitoree has known exposure to a probable or confirmed case. This field is read-only."
* extension contains
  contact-of-known-case 1..1 MS and
  contact-of-known-case-id 0..1 MS
* extension[contact-of-known-case].value[x] only boolean 
* extension[contact-of-known-case-id].value[x] only string 

// Was in Health Care Facility with Known Cases
Extension: WasInHealthCareFacilityWithKnownCases
Id: was-in-health-care-facility-with-known-cases
Title: "Was in Health Care Facility with Known Cases"
Description: "Represents whether or not a monitoree entered or was treated in a health care facility that had known cases. This field is read-only."
* extension contains
  was-in-health-care-facility-with-known-cases 1..1 MS and
  was-in-health-care-facility-with-known-cases-facility-name 0..1 MS
* extension[was-in-health-care-facility-with-known-cases].value[x] only boolean 
* extension[was-in-health-care-facility-with-known-cases-facility-name].value[x] only string

// Laboratory Personnel
Extension: LaboratoryPersonnel
Id: laboratory-personnel
Title: "Laboratory Personnel"
Description: "Represents whether or not a monitoree works in a laboratory or testing facility. This field is read-only."
* extension contains
  laboratory-personnel 1..1 MS and
  laboratory-personnel-facility-name 0..1 MS
* extension[laboratory-personnel].value[x] only boolean 
* extension[laboratory-personnel-facility-name].value[x] only string

// Healthcare Personnel
Extension: HealthcarePersonnel
Id: healthcare-personnel
Title: "Healthcare Personnel"
Description: "Represents whether or not a monitoree works in a healthcare facility. This field is read-only."
* extension contains
  healthcare-personnel 1..1 MS and
  healthcare-personnel-facility-name 0..1 MS
* extension[healthcare-personnel].value[x] only boolean 
* extension[healthcare-personnel-facility-name].value[x] only string

// Member of a Common Exposure Cohort
Extension: MemberOfACommonExposureCohort
Id: member-of-a-common-exposure-cohort
Title: "Member of a Common Exposure Cohort"
Description: "Represents whether or not a monitoree was exposed via a common source or gathering. This field is read-only."
* extension contains
  member-of-a-common-exposure-cohort 1..1 MS and
  member-of-a-common-exposure-cohort-type 0..1 MS
* extension[member-of-a-common-exposure-cohort].value[x] only boolean 
* extension[member-of-a-common-exposure-cohort-type].value[x] only string

// Travel From Affected Country or Area
Extension: TravelFromAffectedCountryOrArea
Id: travel-from-affected-country-or-area
Title: "Travel From Affected Country or Area"
Description: "Represents whether or not a monitoree traveled from a country or area with a high prevalence of disease within the exposure period. This field is read-only."
* value[x] only boolean

// Crew on Passenger or Cargo Flight
Extension: CrewOnPassengerOrCargoFlight
Id: crew-on-passenger-or-cargo-flight
Title: "Crew on Passenger or Cargo Flight"
Description: "Represents whether or not a monitoree works on a passenger, cargo, or other commercial plane. This field is read-only."
* value[x] only boolean

// Source of Report
Extension: SourceOfReport
Id: source-of-report
Title: "Source Of Report"
Description: "Represents where initial information about the monitoree’s exposure or illness was obtained from. This field is read-only."
* extension contains
  source-of-report 1..1 MS and
  specify 0..1 MS
* extension[source-of-report].value[x] only string
* extension[specify].value[x] only string

Extension: SexualOrientation
Id: sexual-orientation
Title: "Sexual Orientation"
Description: "Represents how the monitoree characterizes their attraction to others. This field is read-only."
* value[x] only CodeableConcept
* valueCodeableConcept from SaraAlertSexualOrientation (required)


// Invariant for Continuous Exposure
Invariant:  sara-1
Description: "If 'Continuous Exposure' is set to true, then there shall be no 'Last Date of Exposure'"
Expression: "extension.where(url='http://saraalert.org/StructureDefinition/continuous-exposure').first().valueBoolean implies Patient.extension.where(url='http://saraalert.org/StructureDefinition/last-date-of-exposure').first().valueDate.empty()"
Severity:   #error

// Invariant for Last Date of Exposure
Invariant:  sara-2
Description: "If 'Continuous Exposure' and 'Isolation' are both set to false, then there shall be a 'Last Date of Exposure'"
Expression: "extension.where(url='http://saraalert.org/StructureDefinition/continuous-exposure').first().valueBoolean.not() and extension.where(url='http://saraalert.org/StructureDefinition/isolation').first().valueBoolean.not() implies Patient.extension.where(url='http://saraalert.org/StructureDefinition/last-date-of-exposure').first().valueDate.exists()"
Severity:   #error

// Invariant for Follow-up Note
Invariant:  sara-3
Description: "If 'Follow-up Reason' is not set, then there shall be no 'Follow-up Note'"
Expression: "extension.where(url='http://saraalert.org/StructureDefinition/follow-up-reason').first().valueString.empty().not() implies Patient.extension.where(url='http://saraalert.org/StructureDefinition/follow-up-note').first().valueString.empty()"
Severity:   #error