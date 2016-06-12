module Api
  module V1
    class LocationsController < ApplicationController
      # TODO: Is there an index? Some overview of the forest?
      def show
        # TODO: this is only the happy path. Handle the unhappy, e.g. what if the params aren't there?
        @location = Location.find_by(
            x_coordinate: params[:x],
            y_coordinate: params[:y]
          )
      end
    end
  end
end
