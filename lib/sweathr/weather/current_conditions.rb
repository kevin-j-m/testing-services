module Sweathr
  module Weather
    class CurrentConditions
      def initialize(results)
        @results = results
      end

      def feels_like_f
        value = @results.dig("current_observation", "feelslike_f")
        string_to_float(value)
      end

      private

      def string_to_float(value)
        Float(value)
      rescue
        nil
      end
    end
  end
end
