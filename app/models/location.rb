class Location < ActiveRecord::Base
  # ensure there are no collisions
  # this logic is duplicated at the DB level
  validates_uniqueness_of :x_coordinate, :scope => :y_coordinate

  def x
    self.x_coordinate
  end

  def y
    self.y_coordinate
  end
end
