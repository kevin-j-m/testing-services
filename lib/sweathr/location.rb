require "dotenv/load"
require "net/http"
require "json"

module Sweathr
  class Location
    attr_accessor :endpoint_url

    def initialize(zip_code:)
      @zip_code = zip_code
      @endpoint_url = "http://api.wunderground.com"
    end

    def sweater_weather?
      uri = URI("#{@endpoint_url}/api/#{api_key}/conditions/q/#{@zip_code}.json")
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
