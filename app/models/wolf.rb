class Wolf < ActiveRecord::Base
  has_one :location_object
  has_one :location, through: :location_objects
end