require "sweathr/location"
require "sinatra/base"
require "sinatra/json"
require "capybara_discoball"

class FakeWeatherUnderground < Sinatra::Base
  get "/api/:key/conditions/q/:zip_code.json" do
    json current_observation: { feelslike_f: "56.0" }
  end
end

RSpec.describe Sweathr::Location do
  describe "#sweater_weather?" do
    it "says it's time to break out the sweater" do
      location = Sweathr::Location.new(zip_code: "02108")

      Capybara::Discoball.spin(FakeWeatherUnderground) do |server|
        location.endpoint_url = server.url
        expect(location.sweater_weather?).to be true
      end
    end
  end
end
