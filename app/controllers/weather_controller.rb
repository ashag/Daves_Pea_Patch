class WeatherController < ApplicationController

  def forecast
    w_api = Wunderground.new
    @weather_hash = w_api.forecast_for("Seattle, WA")
    render 'forecast'
  end
end