module Sweathr
  module Testing
    class FakeWeatherClient
      def initialize(results = {})
        @results = results
      end

      def add_condition(zip_code:, temp_f:)
        @results[zip_code] = temp_f
      end

      def current_conditions(zip_code:)
        {
          "current_observation" => {
            "feelslike_f" => @results[zip_code]
          }
        }
      end
    end
  end
end
