class Tree < ActiveRecord::Base
  include ModelHelpers

  has_one :location_object, as: :object
  has_one :location, through: :location_object, inverse_of: :trees

  def to_builder
    Jbuilder.new do |json|
      json.kind(kind)
      # json.url(url)
    end
  end
end
