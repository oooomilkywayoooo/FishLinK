class Public::HomesController < ApplicationController
  def top
    gon.api = Rails.application.credentials.open_weather_api_key
  end

  def about
  end
end
