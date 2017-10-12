require "sweathr/location"

RSpec.describe Sweathr::Location do
  describe "#sweater_weather?" do
    before do
      @test_api_key = ENV["API_KEY"]
      ENV["API_KEY"] = "test_key"
    end

    after { ENV["API_KEY"] = @test_api_key }

    it "says it's time to break out the sweater" do
      weather = Sweathr::Location.new(zip_code: "02108")

      VCR.use_cassette("temp_feels_like_sweater") do
        expect(weather.sweater_weather?).to be true
      end
    end
  end
end
