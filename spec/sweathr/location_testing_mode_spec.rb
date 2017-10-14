require "sweathr/location"
require "sweathr/testing"

RSpec.describe Sweathr::Location do
  describe "#sweater_weather?" do
    context "the current temp feels like it's between 55-65* F" do
      it "says it's time to break out the sweater" do
        Sweathr::Testing.enable!
        Sweathr::Weather.client.add_condition(zip_code: "02108", temp_f: "56.0")

        location = Sweathr::Location.new(zip_code: "02108")
        expect(location.sweater_weather?).to be true

        Sweathr::Testing.disable!
      end
    end

    context "the current temp feels less than 55* F" do
      it "advises against the sweater" do
        Sweathr::Testing.enable!
        Sweathr::Weather.client.add_condition(zip_code: "02108", temp_f: "54.9")

        location = Sweathr::Location.new(zip_code: "02108")
        expect(location.sweater_weather?).to be false

        Sweathr::Testing.disable!
      end
    end

    context "the current temp feels greater than 65* F" do
      it "advises against the sweater" do
        Sweathr::Testing.enable!
        Sweathr::Weather.client.add_condition(zip_code: "02108", temp_f: "66.0")

        location = Sweathr::Location.new(zip_code: "02108")
        expect(location.sweater_weather?).to be false

        Sweathr::Testing.disable!
      end
    end
  end
end
