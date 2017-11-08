require "sweathr/weather"

module Sweathr
  class Location
    def initialize(zip_code:)
      @zip_code = zip_code
    end

    def sweater_weather?
      current_conditions = Sweathr::Weather.current_conditions(zip_code: @zip_code)

      current_conditions.feels_like_f.between?(55, 65)
    end
  end
end
