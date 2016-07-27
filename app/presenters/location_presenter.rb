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

  def actions
    actions = {}
    possible_actions = ["north","south","east","west"]

    possible_actions.each do |action|
      action_name = "#{action}_url"
      url = eval("self.#{action_name}")

      if url
        actions.merge!({action_name => url})
      end
    end

    actions
  end

  def north_url
    north = @location.north
    north ? locations_path(north) : nil
  end

  def south_url
    south = @location.south
    south ? locations_path(south) : nil
  end

  def east_url
    east = @location.east
    east ? locations_path(east) : nil
  end

  def west_url
    west = @location.west
    west ? locations_path(west) : nil
  end

  private

  attr_reader :location
end