require "dotenv/load"
require "net/http"
require "json"

module Sweathr
  class Location
    def initialize(zip_code:)
      @zip_code = zip_code
    end

    def sweater_weather?
      uri = URI("http://api.wunderground.com/api/#{api_key}/conditions/q/#{@zip_code}.json")
      result = Net::HTTP.get(uri)

      response = JSON.parse(result)

      feels_like = response.dig("current_observation", "feelslike_f")
      feels_like.to_f.between?(55, 65)
    end

    private

    def api_key
      ENV["API_KEY"]
    end
  end
end
