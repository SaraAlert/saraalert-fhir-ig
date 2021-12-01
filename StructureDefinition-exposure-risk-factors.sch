<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Extension
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Extension</sch:title>
    <sch:rule context="f:Extension">
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/contact-of-known-case']) &gt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/contact-of-known-case': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/contact-of-known-case']) &lt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/contact-of-known-case': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/was-in-health-care-facility-with-known-cases']) &gt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/was-in-health-care-facility-with-known-cases': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/was-in-health-care-facility-with-known-cases']) &lt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/was-in-health-care-facility-with-known-cases': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/laboratory-personnel']) &gt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/laboratory-personnel': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/laboratory-personnel']) &lt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/laboratory-personnel': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/healthcare-personnel']) &gt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/healthcare-personnel': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/healthcare-personnel']) &lt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/healthcare-personnel': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/member-of-a-common-exposure-cohort']) &gt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/member-of-a-common-exposure-cohort': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/member-of-a-common-exposure-cohort']) &lt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/member-of-a-common-exposure-cohort': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/travel-from-affected-country-or-area']) &gt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/travel-from-affected-country-or-area': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/travel-from-affected-country-or-area']) &lt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/travel-from-affected-country-or-area': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/crew-on-passenger-or-cargo-flight']) &gt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/crew-on-passenger-or-cargo-flight': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://saraalert.org/StructureDefinition/crew-on-passenger-or-cargo-flight']) &lt;= 1">extension with URL = 'http://saraalert.org/StructureDefinition/crew-on-passenger-or-cargo-flight': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Extension</sch:title>
    <sch:rule context="f:Extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Extension.extension</sch:title>
    <sch:rule context="f:Extension/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Extension.value[x] 1</sch:title>
    <sch:rule context="f:Extension/f:value[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>