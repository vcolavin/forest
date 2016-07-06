class LocationPresenter
  include Rails.application.routes.url_helpers

  def initialize(location)
    @location = location
  end

  def x; @location.x_coordinate; end
  def y; @location.y_coordinate; end

  def object_attributes
    @location.objects.map do |object|
      object.to_builder.attributes!
    end
  end

  # TODO: these ought to return nil for locations that don't exist
  def north_url
    location_path(@location.north)
  end

  def south_url
    location_path(@location.south)
  end

  def east_url
    location_path(@location.east)
  end

  def west_url
    location_path(@location.west)
  end

  private

  attr_reader :location
end