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
* issued MS
* issued ^comment = """
    This value must be specified in the format YYYY-MM-DDThh:mm:ss.sss+zz:zz, but note that only
    YYYY-MM-DD will be used by the system. The remainder will be ignored.
    """
* value[x] only CodeableConcept
* valueCodeableConcept MS
* valueCodeableConcept from SaraAlertLabResult (required)
* extension contains created-at named created-at 0..1 MS