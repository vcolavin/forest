class LocationsController < ApplicationController
  def index
    return_json = {}

    if params[:x] && params[:y]
      # TODO: build Location#to_hash method
      location = Location.where(
        x_coordinate: params[:x],
        y_coordinate: params[:y]
      ).first

      if location
        return_json[:location] = {
          id: location.id,
          x_coordinate: location.x,
          y_coordinate: location.y
        }
      else
        return_json[:location] = "nil"
      end

    else
      return_json[:location] = "nil"
    end

    render json: return_json
  end

  def show
    return_json = {}
    render json: return_json
  end
end