class Location < ActiveRecord::Base
  has_many :location_objects , inverse_of: :location

  has_many :wolves, :through => :location_objects, :source => :object, :source_type => 'Wolf', inverse_of: :location
  has_many :trees, :through => :location_objects, :source => :object, :source_type => 'Tree', inverse_of: :location

  validates :x_coordinate, presence: true
  validates :y_coordinate, presence: true
  validate :coordinates_must_be_unique

  # FIXME: This should be handled by the associations. That would be ideal. Why isn't it?
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

  private

  def coordinates_must_be_unique
    if Location.find_by(x_coordinate: x, y_coordinate: y)
      errors.add(:coordinates, "must be unique")
    end
  end
end
