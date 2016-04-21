class LocationsController < ApplicationController
  def index
    return_json = {}

    if params[:x] && params[:y]
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

        objects = location.objects

        if objects.any?
          return_json[:location][:objects] = objects.map do |object|
            {
              type: object.class.to_s.downcase,
              id: object.id
            }
          end
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