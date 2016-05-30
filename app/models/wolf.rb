class Wolf < ActiveRecord::Base
  has_one :location_object, as: :object
  has_one :location, through: :location_objects

  def to_builder
    Jbuilder.new do |wolf|
      wolf.name name
    end
  end
end