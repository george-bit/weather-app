class TemperaturesForm
  include ActiveModel::Model

  attr_accessor :max_cold_temp, :min_hot_temp

  def save
    temperatures = Temperatures.first

    if !temperatures.nil?
      temperatures.update!(max_cold_temp: max_cold_temp, min_hot_temp: min_hot_temp)
    else
      Temperatures.create!(max_cold_temp: max_cold_temp, min_hot_temp: min_hot_temp)
    end
  end
end
