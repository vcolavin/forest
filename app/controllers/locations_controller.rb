class LocationsController < ApplicationController
  def show
    @location = Location.find_by(
        x_coordinate: params[:x],
        y_coordinate: params[:y]
      )
  end
end