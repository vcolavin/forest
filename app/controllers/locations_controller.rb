class LocationsController < ApplicationController

  def index
    return_json = {}

  # TODO: move this location finding logic out to a callback or something? It's ugly here.
    if params[:x] && params[:y]

      location = Location.find_by(
        x_coordinate: params[:x],
        y_coordinate: params[:y]
      )

      if location
        # TODO: move all this hash building out to some JBuilder stuff

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
        # TODO: ugh
        return_json[:location] = "nil"
      end

    else
      return_json[:location] = "nil"
    end

    render json: return_json
  end
end