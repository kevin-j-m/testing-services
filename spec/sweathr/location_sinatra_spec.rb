require "sweathr/location"
require "sinatra/base"
require "sinatra/json"
require "capybara_discoball"

class FakeWeatherUnderground < Sinatra::Base
  get "/api/test_key/conditions/q/:zip_code.json" do |zip_code|
    json current_observation: { feelslike_f: "56.0" }
  end
end

RSpec.describe Sweathr::Location do
  before do
    @test_api_key = ENV["API_KEY"]
    ENV["API_KEY"] = "test_key"
  end

  after { ENV["API_KEY"] = @test_api_key }

  describe "#sweater_weather?" do
    it "says it's time to break out the sweater" do
      weather = Sweathr::Location.new(zip_code: "02108")

      Capybara::Discoball.spin(FakeWeatherUnderground) do |server|
        weather.endpoint_url = server.url
        expect(weather.sweater_weather?).to be true
      end
    end
  end
end
