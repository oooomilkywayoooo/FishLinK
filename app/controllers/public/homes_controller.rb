class Public::HomesController < ApplicationController
  def top
    gon.api = Rails.application.credentials.open_weather_api_key
    @posts = Post.order('id DESC').limit(4)
  end

  def about
  end
end
