class SetTemperaturesController < ApplicationController
  def index
    @temperatures_form = TemperaturesForm.new
  end

  def update
    @temperatures_form = TemperaturesForm.new(max_cold_temp: params[:max_cold_temp], min_hot_temp: params[:min_hot_temp])

    if @temperatures_form.save
        redirect_to root_path

        flash[:alert] = 'Temperatures updated'
      else
        render :index
      end
  end
end
