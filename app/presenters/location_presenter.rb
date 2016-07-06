class LocationPresenter
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

  # TODO: these need to return nil for locations that don't exist
  def north_url
    url_for(@location.north)
  end

  def south_url
    url_for(@location.south)
  end

  def east_url
    url_for(@location.east)
  end

  def west_url
    url_for(@location.west)
  end

  private

  attr_reader :location
end