class WeatherController < ApplicationController
  def index
  end

  def forecast
    temperature = find_temperature(params[:postcode])
    max_cold_temp = Temperatures.first.max_cold_temp || MAX_COLD_TEMP
    min_hot_temp = Temperatures.first.min_hot_temp || MIN_HOT_TEMP

    case
    when temperature.nil?
      flash[:alert] = 'Postcode invalid'
    when temperature <= max_cold_temp
      flash[:cold] = 'Cold'
    when temperature > max_cold_temp && temperature < min_hot_temp
      flash[:warm] = 'Warm'
    when temperature >= min_hot_temp
      flash[:hot] = 'Hot'
    end

    return render action: :index
  end

private

  def request_api(url)
    response = Excon.get(url)

    return nil if response.status != 200
    JSON.parse(response.body)['forecast']['forecastday'][0]['day']['maxtemp_c']
  end

  def find_temperature(postcode)
    api_key = '460c6c49c1b7448c93a203430212011'

    request_api(
      "https://api.weatherapi.com/v1/forecast.json?key=#{URI.encode(api_key)}&q=#{URI.encode(postcode)}"
    )
  end
end
