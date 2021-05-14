// Sara Alert Provenance profile.
Profile: SaraAlertProvenance
Parent: Provenance
Id: sara-alert-provenance
Title: "Sara Alert Provenance Profile"
Description: "The Sara Alert Provenance profile represents a monitoree history item."
* meta.lastUpdated 1..1 MS
* target 1..1 MS
* recorded MS
* agent.who MS
* agent.onBehalfOf MS
* extension contains
    comment named comment 0..1 MS and
    history-type named history-type 0..1 MS

// Comment Extension
Extension: Comment
Id: comment
Title: "Comment"
Description: "Represents the comment for a monitoree history item."
* value[x] only string

// History Type Extension
Extension: HistoryType
Id: history-type
Title: "History Type"
Description: "Represents the history type for a monitoree history item."
* value[x] only string

