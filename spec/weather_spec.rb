require "weather"

RSpec.describe Weather do
  describe "#sweater_weather?" do
    it "says it's time to break out the sweater" do
      weather = Weather.new(zip_code: "02108")

      expect(weather.sweater_weather?).to be true
    end
  end
end
