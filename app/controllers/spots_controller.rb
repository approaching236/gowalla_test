require 'json'

class SpotsController < ActionController::Base
  protect_from_forgery

  def index
    spots_json = JSON.parse(Net::HTTP.get(URI.parse'http://api.gowalla.com/spots.json?lat=32.899056&lng=-117.199348&radius=500'))

    @spots = Array.new
    spots_json['spots'].each do |spot|
      if spot.first != "groups"
        @spots.push spot
      end
    end

    if params[:sort] == 'name'
      if request.referer.include? "name"
        @spots.sort! { |a,b| b['name'] <=> a['name'] }
      else
        @spots.sort! { |a,b| a['name'] <=> b['name'] }
      end
    elsif params[:sort] == 'region'
      @spots.sort! { |a,b| a['region'] <=> b['region'] }
    elsif params[:sort] == 'checkins'
      if request.referer.include? "checkins"
        @spots.sort! { |a,b| b['checkins_count'] <=> a['checkins_count'] }
      else
        @spots.sort! { |a,b| a['checkins_count'] <=> b['checkins_count'] }
      end
    elsif params[:sort] == 'trending'
      if request.referer.include? "trending"
        @spots.sort! { |a,b| b['trending_level'] <=> a['trending_level'] }
      else
        @spots.sort! { |a,b| a['trending_level'] <=> b['trending_level'] }
      end
    elsif params[:sort] == 'users'
      if request.referer.include? "users"
        @spots.sort! { |a,b| b['users_count'] <=> a['users_count'] }
      else
        @spots.sort! { |a,b| a['users_count'] <=> b['users_count'] }
      end
    end
  end
end
