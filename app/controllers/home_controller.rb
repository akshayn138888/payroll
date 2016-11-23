class HomeController < ApplicationController
  def index
    begin
      @location = Geocoder.coordinates(current_user.scsc)
    rescue Exception => e
      @location = Geocoder.coordinates(current_user.csc)
    end
  end
end
