class Location < ActiveRecord::Base
  validates_uniqueness_of :x_coordinate, :scope => :y_coordinate
end
