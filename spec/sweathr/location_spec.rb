require "sweathr/location"
require_relative "../support/fake_weather_client"

RSpec.describe Sweathr::Location do
  describe "#sweater_weather?" do
    context "the current temp feels like it's between 55-65* F" do
      before do
        allow(Sweathr::Weather).to receive(:current_conditions)
          .with(zip_code: "02108")
          .and_return(double(feels_like_f: 56.0))
      end

      it "says it's time to break out the sweater" do
        location = Sweathr::Location.new(zip_code: "02108")
        expect(location.sweater_weather?).to be true
      end
    end

    context "the current temp feels less than 55* F" do
      before do
        allow(Sweathr::Weather).to receive(:current_conditions)
          .with(zip_code: "02108")
          .and_return(double(feels_like_f: 54.9))
      end

      it "advises against the sweater" do
        location = Sweathr::Location.new(zip_code: "02108")
        expect(location.sweater_weather?).to be false
      end
    end

    context "the current temp feels greater than 65* F" do
      before do
        allow(Sweathr::Weather).to receive(:current_conditions)
          .with(zip_code: "02108")
          .and_return(double(feels_like_f: 66.0))
      end

      it "advises against the sweater" do
        location = Sweathr::Location.new(zip_code: "02108")
        expect(location.sweater_weather?).to be false
      end
    end
  end
end
