class LocationsController < ApplicationController

  def index
    return_json = {}

  # TODO: move this location finding logic out to a callback or something? It's ugly.
    if params[:x] && params[:y]

      location = Location.find_by(
        x_coordinate: params[:x],
        y_coordinate: params[:y]
      )

      if location
        return_json[:location] = {
          id: location.id,
          xCoordinate: location.x,
          yCoordinate: location.y
        }

        objects = location.objects

        return_json[:location][:objects] = objects.map do |object|
          {
            type: object.class.to_s.downcase,
            id: object.id
          }
        end

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