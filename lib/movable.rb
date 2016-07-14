# TODO: obv this needs to like be included in objects that can move around the Location grid
# just stubbing this stuff out to remember later
module Movable
  def go_north!
    new_location = self.north
    if new_location
      self.location = new_location
    end
  end

  def go_south!
    new_location = self.south
    if new_location
      self.location = new_location
    end
  end

  def go_east!
    new_location = self.east
    if new_location
      self.location = new_location
    end
  end

  def go_west!
    new_location = self.west
    if new_location
      self.location = new_location
    end
  end
end