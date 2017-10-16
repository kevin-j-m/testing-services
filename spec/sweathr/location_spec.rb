require "sweathr/location"

RSpec.describe Sweathr::Location do
  describe "#sweater_weather?" do
    it "says it's time to break out the sweater" do
      location = Sweathr::Location.new(zip_code: "02108")

      expect(location.sweater_weather?).to be true
    end
  end
end
