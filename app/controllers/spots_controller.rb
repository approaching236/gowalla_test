class SpotsController < ActionController::Base
  protect_from_forgery

  def index
    @spots = Spot.find(:all, :params => { :lat => '32.899056', :lng => '-117.199348', :radius => '500'})
  end
end
