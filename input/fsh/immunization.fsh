Alias: CVX = http://hl7.org/fhir/sid/cvx
Alias: NULL = http://terminology.hl7.org/CodeSystem/v3-NullFlavor

// Sara Alert Immunization.
Profile: SaraAlertImmunization
Parent: Immunization
Id: sara-alert-immunization
Title: "Sara Alert Immunization Profile"
Description: "The Sara Alert Immunization profile represents a vaccination of a monitoree."
* status = #completed
* vaccineCode from COVID19VaccinesValueSet (required)
* vaccineCode MS
* patient only Reference(SaraAlertPatient)
* patient MS
* occurrence[x] MS
* note MS
* protocolApplied 1..1 MS
* protocolApplied.targetDisease 1..*
* protocolApplied.targetDisease = CVX#213
* protocolApplied.doseNumber[x] only string
* protocolApplied.doseNumberString MS
* extension contains created-at named created-at 0..1 MS


ValueSet: COVID19VaccinesValueSet
Id: covid-19-vaccines
Title: "COVID-19 Vaccines Value Set"
* CVX#207 "Moderna COVID-19 Vaccine"
* CVX#208 "Pfizer COVID-19 Vaccine"
* CVX#212 "Janssen COVID-19 Vaccine"
* NULL#UNK "unknown"

// Created At
Extension: CreatedAt
Id: created-at
Title: "Created At"
Description: "This field represents the date and time that a resource was created in the system. This field is read-only."
* value[x] only dateTime