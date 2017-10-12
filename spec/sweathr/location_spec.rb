require "sweathr/location"

RSpec.describe Sweathr::Location do
  describe "#sweater_weather?" do
    it "says it's time to break out the sweater" do
      weather = Sweathr::Location.new(zip_code: "02108")

      expect(weather.sweater_weather?).to be true
    end
  end
end
