class LocationsController < ApplicationController
  def index
    render json: "hey index"
  end

  def show
    render json: "hey show"
  end
end