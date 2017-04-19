require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================



    url="https://api.darksky.net/forecast/e82ba3bdbd58b2a5e23db32640e5216e/"+@lat+","+@lng
    parsed_data = JSON.parse(open(url).read)
    temperature = parsed_data["currently"]["temperature"]

    @current_temperature = temperature

    summary_curr=parsed_data["currently"]["summary"]
    @current_summary = summary_curr
    summary_min=parsed_data["minutely"]["summary"]
    @summary_of_next_sixty_minutes = summary_min
    summary_hour=parsed_data["hourly"]["summary"]
    @summary_of_next_several_hours = summary_hour
summary_day=parsed_data["daily"]["summary"]
    @summary_of_next_several_days = summary_day

    render("forecast/coords_to_weather.html.erb")
  end
end
