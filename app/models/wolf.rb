class Wolf < ActiveRecord::Base
  has_one :location_object, as: :object
  has_one :location, through: :location_objects
end