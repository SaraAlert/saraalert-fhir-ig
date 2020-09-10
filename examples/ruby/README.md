# Sara Alert FHIR Client App

This simple example application written in the Ruby programming language illustrates how to authenticate and use the Sara Alert FHIR API, using the M2M workflow.

First, follow the directions in the [wiki walk-through](https://github.com/SaraAlert/saraalert-fhir-ig/wiki/M2M-Walk-Through) to register your application.

Second, save the PEM file from Step #3 in the walk-through to `private.pem` (the existing file in this repository is only a placeholder).

Third, replace the following lines in `app.rb` with your client ID and KID (the client ID was set during registration in Step #4 and the KID can be obtained from the public key in Step #3):

```ruby
CLIENT_ID = 'testApp'
KID = '0sE1L26Y6vuHzDt2G3TzotGQg6w='
```

Third, after installing the dependency (using `bundle install`) execute the script:

```
bundle exec ruby app.rb
```

# License

Copyright 2020+ The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
