class Tree < ActiveRecord::Base
  include ObjectHelpers

  has_one :location_object, as: :object
  has_one :location, through: :location_object
end
