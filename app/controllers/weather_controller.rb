class WeatherController < ApplicationController

  def forecast
    w_api = Wunderground.new(ENV["WUNDERGROUND_API_KEY"])
    @weather_hash = w_api.forecast_for("South Africa", "Cape Town", lang: "EN")
  end
end
