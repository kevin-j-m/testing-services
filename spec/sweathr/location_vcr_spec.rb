require "sweathr/location"

RSpec.describe Sweathr::Location do
  describe "#sweater_weather?" do
    before do
      Sweathr::Weather.client = Sweathr::Weather::Api.new(api_key: "test_key")
    end

    after { Sweathr::Weather.client = Sweathr::Weather::Api.new }

    it "says it's time to break out the sweater" do
      weather = Sweathr::Location.new(zip_code: "02108")

      VCR.use_cassette("temp_feels_like_sweater") do
        expect(weather.sweater_weather?).to be true
      end
    end
  end
end
