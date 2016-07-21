class Wolf < ActiveRecord::Base
  include ObjectHelpers

  has_one :location_object, as: :object
  has_one :location, through: :location_object, inverse_of: :wolves

  def to_builder
    Jbuilder.new do |json|
      json.kind(kind)
      json.name(name)
      # json.url(url)
    end
  end
end
