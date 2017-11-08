require "sweathr/weather/api"

RSpec.describe Sweathr::Weather::Api do
  describe "#current_conditions" do
    it "retrieves the current conditions from the Weather Underground API" do
      key = ENV["TEST_API_KEY"] || "test_key"
      api = Sweathr::Weather::Api.new(api_key: key)

      VCR.use_cassette("temp_feels_like_sweater") do
        response = api.current_conditions(zip_code: "02108")

        expect(response).to include(
          "current_observation" => a_hash_including(
            "feelslike_f" => a_kind_of(String)
          )
        )
      end
    end
  end
end
