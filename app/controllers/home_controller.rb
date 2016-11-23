class HomeController < ApplicationController
  def index
    @location = Geocoder.coordinates(current_user.scsc)
    @location = Geocoder.coordinates(current_user.csc) unless @location.present?
  end
end
