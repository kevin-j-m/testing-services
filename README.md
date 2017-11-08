# Fake It While You Make It

We all write code to interface with external systems, like a web service or a message queue. Can you confidently write tests without requiring the system as a dependency? How can you shield users of your code from the inner workings of the interface? Explore one attempt to answer these questions.

There's no shortage of tools at your disposal to solve these problems. This talk will introduce some available options, provide guidance on when one approach may be more appropriate than another, and discuss how to use these tools together to ease the testing process.

This repository contains all of the code samples that accompany the [talk](fake_it_while_you_make_it.key) of the same name.

## Testing Methods

1. [Direct Interaction](https://github.com/kevin-j-m/testing-services/blob/46c16ff0129127a1faba1c4c149f1f5ee5898b5f/spec/sweathr/location_spec.rb)
2. [Stub](https://github.com/kevin-j-m/testing-services/blob/46c16ff0129127a1faba1c4c149f1f5ee5898b5f/spec/sweathr/location_webmock_spec.rb)
3. [Fake](https://github.com/kevin-j-m/testing-services/blob/46c16ff0129127a1faba1c4c149f1f5ee5898b5f/spec/sweathr/location_sinatra_spec.rb)
4. [Fixture](https://github.com/kevin-j-m/testing-services/blob/46c16ff0129127a1faba1c4c149f1f5ee5898b5f/spec/sweathr/location_vcr_spec.rb)
5. [Test Mode](spec/sweathr/location_testing_mode_spec.rb)

## Dependency-Isolating Architecture

1. API Client
   * [Implementation](lib/sweathr/weather/api.rb)
   * [Test](spec/sweathr/weather/api_spec.rb)
2. Data Representation
   * [Implementation](lib/sweathr/weather/current_conditions.rb)
   * [Test](spec/sweathr/weather/current_conditions_spec.rb)
3. Domain
   * [Implementation](lib/sweathr/weather.rb)
4. Implementation
   * [Implementation](lib/sweathr/location.rb)
   * [Test](spec/sweathr/location_spec.rb)
5. Fake Client
   * [Implementation](lib/sweathr/testing/fake_weather_client.rb)
6. Testing
   * [Implementation](lib/sweathr/testing.rb)
