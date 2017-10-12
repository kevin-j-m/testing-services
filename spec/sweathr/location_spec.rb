require "sweathr/location"
require_relative "../support/fake_weather_client"

RSpec.describe Sweathr::Location do
  describe "#sweater_weather?" do
    context "the current temp feels like it's between 55-65* F" do
      let(:fake) { Sweathr::Weather::FakeWeatherClient.new(feels_like: "56") }

      before { Sweathr::Weather.client = fake }
      after { Sweathr::Weather.client = Sweathr::Weather::Api.new }

      it "says it's time to break out the sweater" do
        location = Sweathr::Location.new(zip_code: "02108")
        expect(location.sweater_weather?).to be true
      end
    end

    context "the current temp feels less than 55* F" do
      let(:fake) { Sweathr::Weather::FakeWeatherClient.new(feels_like: "54") }

      before { Sweathr::Weather.client = fake }
      after { Sweathr::Weather.client = Sweathr::Weather::Api.new }

      it "advises against the sweater" do
        location = Sweathr::Location.new(zip_code: "02108")
        expect(location.sweater_weather?).to be false
      end
    end

    context "the current temp feels greater than 65* F" do
      let(:fake) { Sweathr::Weather::FakeWeatherClient.new(feels_like: "66") }

      before { Sweathr::Weather.client = fake }
      after { Sweathr::Weather.client = Sweathr::Weather::Api.new }

      it "advises against the sweater" do
        location = Sweathr::Location.new(zip_code: "02108")
        expect(location.sweater_weather?).to be false
      end
    end
  end
end
