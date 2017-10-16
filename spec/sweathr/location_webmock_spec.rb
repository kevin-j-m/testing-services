require "sweathr/location"

RSpec.describe Sweathr::Location do
  describe "#sweater_weather?" do
    let(:api_response) { { current_observation: { feelslike_f: feels_like } }.to_json }

    context "the current temp feels like it's between 55-65* F" do
      let(:feels_like) { "55.0" }

      it "says it's time to break out the sweater" do
        location = Sweathr::Location.new(zip_code: "02108")

        stub_request(:get, "http://api.wunderground.com/api/#{ENV['API_KEY']}/conditions/q/02108.json")
          .to_return(status: 200, body: api_response)

        expect(location.sweater_weather?).to be true
      end
    end

    context "the current temp feels less than 55* F" do
      let(:feels_like) { "54.9" }

      it "advises against the sweater" do
        weather = Sweathr::Location.new(zip_code: "02108")

        stub_request(:get, "http://api.wunderground.com/api/#{ENV['API_KEY']}/conditions/q/02108.json")
          .to_return(status: 200, body: api_response)

        expect(weather.sweater_weather?).to be false
      end
    end

    context "the current temp feels greater than 65* F" do
      let(:feels_like) { "65.1" }

      it "advises against the sweater" do
        weather = Sweathr::Location.new(zip_code: "02108")

        stub_request(:get, "http://api.wunderground.com/api/#{ENV['API_KEY']}/conditions/q/02108.json")
          .to_return(status: 200, body: api_response)

        expect(weather.sweater_weather?).to be false
      end
    end
  end
end
