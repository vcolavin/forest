class LocationObject < ActiveRecord::Base
  belongs_to :location
  belongs_to :object, polymorphic: true
end
