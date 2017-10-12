module Sweathr
  module Weather
    class FakeWeatherClient
      def initialize(results = {})
        @results = results
      end

      def current_conditions(zip_code:)
        {
          "current_observation" => {
            "feelslike_f" => @results.fetch(:feels_like, "55.5")
          }
        }
      end
    end
  end
end
