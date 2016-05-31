class Wolf < ActiveRecord::Base
  include ModelHelpers

  has_one :location_object, as: :object
  has_one :location, through: :location_objects

  def to_builder
    Jbuilder.new do |json|
      json.kind(kind)
      json.name(name)
      # json.url(url)
    end
  end
end