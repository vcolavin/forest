class Location < ActiveRecord::Base
  has_many :location_objects#, as: :objects

  # TODO: purportedly gives #wolves and #trees methods
  # has_many :wolves, :through => :location_objects, :source => :object, :source_type => 'Wolf'
  # has_many :trees, :through => :location_objects, :source => :object, :source_type => 'Tree'

  # ensure there are no collisions
  # this logic is duplicated at the DB level
  validates_uniqueness_of :x_coordinate, :scope => :y_coordinate

  # TODO: could this be a scope? Make sure to avoid N1 errors too.
  def objects
    self.location_objects.map do |location_object|
      location_object.object
    end
  end

  def x
    self.x_coordinate
  end

  def y
    self.y_coordinate
  end
end
