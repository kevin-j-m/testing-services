require "sweathr/testing/fake_weather_client"

module Sweathr
  module Testing
    def self.enable!
      Sweathr::Weather.client = Sweathr::Testing::FakeWeatherClient.new
      @active = true
    end

    def self.disable!
      Sweathr::Weather.client = Sweathr::Weather::Api.new
      @active = false
    end

    def self.enabled?
      @active
    end

    def self.disabled?
      !enabled?
    end
  end
end
