class Location < ActiveRecord::Base
  has_many :location_objects, as: :objects

  # TODO: purportedly gives #wolves and #trees methods
  # has_many :wolves, :through => :location_objects, :source => :object, :source_type => 'Wolf'
  # has_many :trees, :through => :location_objects, :source => :object, :source_type => 'Tree'

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
