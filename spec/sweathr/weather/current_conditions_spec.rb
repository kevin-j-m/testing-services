require "sweathr/weather/current_conditions"

RSpec.describe Sweathr::Weather::CurrentConditions do
  describe "#feels_like_f" do
    it "provides the feels like temperature in fahrenheit" do
      json = {
        "current_observation" => {
          "feelslike_f" => "55.5"
        }
      }
      conditions = Sweathr::Weather::CurrentConditions.new(json)

      expect(conditions.feels_like_f).to eq 55.5
    end

    context "with a non-numeric result" do
      it "provides no result" do
        json = {
          "current_observation" => {
            "feelslike_f" => "not a number"
          }
        }
        conditions = Sweathr::Weather::CurrentConditions.new(json)

        expect(conditions.feels_like_f).to be_nil
      end
    end

    context "with no current observation" do
      it "provides no result" do
        json = { }
        conditions = Sweathr::Weather::CurrentConditions.new(json)

        expect(conditions.feels_like_f).to be_nil
      end
    end

    context "with no feels like f temperature" do
      it "provides no result" do
        json = {
          "current_observation" => { }
        }
        conditions = Sweathr::Weather::CurrentConditions.new(json)

        expect(conditions.feels_like_f).to be_nil
      end
    end
  end
end
