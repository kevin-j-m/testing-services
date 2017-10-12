module Sweathr
  module Weather
    class Api
      BASE_URI = "http://api.wunderground.com/api".freeze

      def initialize(api_key: ENV["API_KEY"])
        @api_key = api_key
      end

      def current_conditions(zip_code:)
        uri = URI("#{auth_uri}/conditions/q/#{zip_code}.json")

        Net::HTTP.get(uri)
      end

      private

      def auth_uri
        "#{BASE_URI}/#{@api_key}"
      end
    end
  end
end
