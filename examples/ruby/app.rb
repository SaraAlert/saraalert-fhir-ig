require 'jwt'
require 'time'
require 'uri'
require 'net/http'

# -----------------------------------
# SET INFORMATION ABOUT CLIENT APP
# -----------------------------------
TOKEN_URL = 'http://localhost:3000/oauth/token'
CLIENT_ID = 'testApp'
KID = '0sE1L26Y6vuHzDt2G3TzotGQg6w='
private_key = OpenSSL::PKey::RSA.new(File.read('private.pem'))
public_key = private_key.public_key

# -----------------------------------
# BUILD THE CLIENT ASSERTION
# -----------------------------------

header = {
  'alg' => 'RS384',
  'kid' => KID,
  'typ' => 'JWT'
}
puts "HEADER:\n#{header.to_json}"

payload = {
  'iss' => CLIENT_ID,
  'sub' => CLIENT_ID,
  'aud' => TOKEN_URL,
  'exp' => Time.now.to_i + (5 * 60),
  'jti' => 1,
}
puts "PAYLOAD:\n#{payload.to_json}"
puts '---------------------'

# token = JWT.encode payload, key, algorithm, header_fields
client_assertion = JWT.encode payload, private_key, algorithm='RS384', header_fields=header
puts "CLIENT ASSERTION:\n#{client_assertion}"
puts '---------------------'

# -----------------------------------
# BUILD THE ACCESS TOKEN REQUEST
# -----------------------------------
parameters = {
  'client_id' => CLIENT_ID,
  'client_assertion' => client_assertion,
  'client_assertion_type' => 'urn:ietf:params:oauth:client-assertion-type:jwt-bearer',
  'grant_type' => 'client_credentials',
  'scope' => 'system/Patient.* system/Observation.read system/QuestionnaireResponse.read'
}
puts "PARAMETERS:\n#{parameters.to_json}"
puts '---------------------'

decoded_assertion = JWT.decode client_assertion, public_key, true, { algorithm:'RS384' }
puts "DECODED:\n#{decoded_assertion.to_json}"
puts '---------------------'

# -----------------------------------
# REQUEST AN ACCESS TOKEN
# -----------------------------------
url = URI(TOKEN_URL)
http = Net::HTTP.new(url.host, url.port);
request = Net::HTTP::Post.new(url)
request['Content-Type'] = 'application/json'
request.body = parameters.to_json
response = http.request(request)
body = response.read_body
access_token = JSON.parse(body)
puts "ACCESS TOKEN:\n#{body}"
puts "ACCESS TOKEN:\n#{access_token['access_token']}"
puts '---------------------'

# -----------------------------------
# FHIR: Get a Patient
# -----------------------------------
url = URI("http://localhost:3000/fhir/r4/Patient/1")
http = Net::HTTP.new(url.host, url.port);
request = Net::HTTP::Get.new(url)
request['Accept'] = 'application/fhir+json'
request['Authorization'] = "Bearer #{access_token['access_token']}"
response = http.request(request)
body = response.read_body

puts "GET FHIR PATIENT:\n#{body}"
puts '---------------------'

# -----------------------------------
# FHIR: Get some Observations
# -----------------------------------
url = URI("http://localhost:3000/fhir/r4/Observation?patient=1")
http = Net::HTTP.new(url.host, url.port);
request = Net::HTTP::Get.new(url)
request['Content-Type'] = 'application/fhir+json'
request['Accept'] = 'application/fhir+json'
request['Authorization'] = "Bearer #{access_token['access_token']}"
response = http.request(request)
body = response.read_body
json = JSON.parse(body)
puts "GET FHIR OBSERVATIONS FOR PATIENT:\nCOUNT: #{json['total']}"
puts '---------------------'

# -----------------------------------
# FHIR: Write an Observation
# Writing Observations is not yet
# supported by the API.
# -----------------------------------
# observation = {
#   'status' => 'final',
#   'code' => {
#     'text' => 'Test Result'
#   },
#   'subject' => {
#     'reference' => 'Patient/1'
#   },
#   'effectiveDateTime' => '2020-05-21T00:00:00+00:00',
#   'valueString' => 'negative',
#   'resourceType' => 'Observation'
# }
# url = URI("http://localhost:3000/fhir/r4/Observation")
# http = Net::HTTP.new(url.host, url.port);
# request = Net::HTTP::Post.new(url)
# request['Content-Type'] = 'application/fhir+json'
# request['Accept'] = 'application/fhir+json'
# request['Authorization'] = "Bearer #{access_token['access_token']}"
# request.body = observation.to_json
# response = http.request(request)
# body = response.read_body
# puts "WRITE OBSERVATION FOR PATIENT:\n#{response}"
# puts '---------------------'

# -----------------------------------
# FHIR: Create a Patient
# -----------------------------------
patient = {
  'extension' => [{
      'extension' => [{
          'url' => 'ombCategory',
          'valueCoding' => {
            'system' => 'urn:oid:2.16.840.1.113883.6.238',
            'code' => '2054-5',
            'display' => 'Black or African American'
          }},{
          'url' => 'text',
          'valueString' => 'Black or African American'
        }],
      'url' => 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-race'
    },{
      'extension' => [{
          'url' => 'ombCategory',
          'valueCoding' => {
            'system' => 'urn:oid:2.16.840.1.113883.6.238',
            'code' => '2186-5',
            'display' => 'Non Hispanic or Latino'
        }},{
          'url' => 'text',
          'valueString' => 'Non Hispanic or Latino'
        }],
      'url' => 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity'
    },{
      'url' => 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex',
      'valueCode' => 'M'
    },{
      'url' => 'http://saraalert.org/StructureDefinition/preferred-contact-method',
      'valueString' => 'SMS Texted Weblink'
    },{
      'url' => 'http://saraalert.org/StructureDefinition/symptom-onset-date',
      'valueDate' => '2020-09-11'
    },{
      'url' => 'http://saraalert.org/StructureDefinition/last-exposure-date',
      'valueDate' => '2020-09-01'
    },{
      'url' => 'http://saraalert.org/StructureDefinition/isolation',
      'valueBoolean' => true
    }
  ],
  'active' => true,
  'name' => [{
      'family' => 'Smith36',
      'given' => [ 'Raymond39' ]
    }],
  'telecom' => [{
      'system' => 'phone',
      'value' => '(555) 555-0164',
      'rank' => 1
    },{
      'system' => 'email',
      'value' => '6484346009fake@example.com',
      'rank' => 1
    }],
  'birthDate' => '1944-05-05',
  'address' => [{
      'line' => [ '37615 Deckow Mills' ],
      'city' => 'Bedford',
      'state' => 'Massachusetts',
      'postalCode' => '01730'
    }],
  'resourceType' => 'Patient'
}
url = URI("http://localhost:3000/fhir/r4/Patient")
http = Net::HTTP.new(url.host, url.port);
request = Net::HTTP::Post.new(url)
request['Content-Type'] = 'application/fhir+json'
request['Accept'] = 'application/fhir+json'
request['Authorization'] = "Bearer #{access_token['access_token']}"
request.body = patient.to_json
response = http.request(request)
body = response.read_body
puts "WRITE PATIENT:\n#{response}"
puts '---------------------'
