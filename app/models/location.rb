class Location < ActiveRecord::Base
  has_many :location_objects#, as: :objects

  # TODO: purportedly gives #wolves and #trees methods
  # has_many :wolves, :through => :location_objects, :source => :object, :source_type => 'Wolf'
  # has_many :trees, :through => :location_objects, :source => :object, :source_type => 'Tree'

  validates_uniqueness_of :x_coordinate, :scope => :y_coordinate

  # TODO: could this be a scope?
  # TODO: It should be handled by the associations. That would be ideal. Why isn't it?
  def objects
    self.location_objects.includes(:object).map do |location_object|
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
