module Sweathr
  module Weather
    class CurrentConditions
      def initialize(results)
        @results = results
      end

      def feels_like_f
        @results.dig("current_observation", "feelslike_f").to_f
      end
    end
  end
end
