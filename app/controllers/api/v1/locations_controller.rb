class Api::V1::LocationsController < ApplicationController
  def show

    @location = Location.find_by(
        x_coordinate: params.fetch(:x),
        y_coordinate: params.fetch(:y)
      )

    raise ActiveRecord::RecordNotFound if @location.nil?
  end
end
