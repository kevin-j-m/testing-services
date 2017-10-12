require "sweathr/weather"

RSpec.describe Sweathr::Weather do
  describe "#sweater_weather?" do
    it "says it's time to break out the sweater" do
      weather = Sweathr::Weather.new(zip_code: "02108")

      expect(weather.sweater_weather?).to be true
    end
  end
end
