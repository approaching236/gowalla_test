require 'json'

class SpotsController < ActionController::Base
  protect_from_forgery

  def index
    @spots = JSON.parse(Net::HTTP.get(URI.parse'http://api.gowalla.com/spots.json?lat=32.899056&lng=-117.199348&radius=500'))
    logger.info 'sup'
    logger.info params[:sort]
  end
end
