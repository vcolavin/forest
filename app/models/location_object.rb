class LocationObject < ActiveRecord::Base
  belongs_to :location, inverse_of: :location_objects
  belongs_to :object, polymorphic: true
end
