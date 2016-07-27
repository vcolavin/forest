class Movable < SimpleDelegator
  def move!
    direction = ['north', 'south', 'east', 'west'].sample
    eval("self.move_#{direction}!")
  end

  def move_north!
    north = self.location.north
    north ? (self.location = north) : nil
  end

  def move_south!
    south = self.location.south
    south ? (self.location = south) : nil
  end

  def move_east!
    east = self.location.east
    east ? (self.location = east) : nil
  end

  def move_west!
    west = self.location.west
    west ? (self.location = west) : nil
  end
end