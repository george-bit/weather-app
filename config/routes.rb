# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'weather#index'

  get '/forecast' => 'weather#forecast'

  get '/set-temperatures' => 'set_temperatures#index', as: :set_temperatures
  put '/set-temperatures' => 'set_temperatures#update'
end
