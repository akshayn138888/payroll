class HomeController < ApplicationController
  def index
    if current_user
      @location = Geocoder.coordinates(current_user.scsc)
      @location = Geocoder.coordinates(current_user.csc) unless @location.present?
	else
	  render :index, layout: "landing"
    end
  end
end
