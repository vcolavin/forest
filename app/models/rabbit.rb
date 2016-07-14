class Rabbit < ActiveRecord::Base
  include ObjectHelpers
  include Movable

  has_one :location_object, as: :object
  has_one :location, through: :location_object, inverse_of: :rabbits

  def to_builder
    Jbuilder.new do |json|
      json.kind(kind)
      # json.url(url)
    end
  end
end
