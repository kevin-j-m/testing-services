require "sweathr/weather/api"
require "sweathr/weather/current_conditions"

module Sweathr
  module Weather
    def self.client
      @client ||= Api.new
    end

    def self.client=(client)
      @client = client
    end

    def self.current_conditions(zip_code:)
      Sweathr::Weather::CurrentConditions.new(client.current_conditions(zip_code: zip_code))
    end
  end
end
