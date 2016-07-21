module ObjectHelpers
  # this could exist in a Locatable decorator, but
  # because every object is Locatable, it seems easiest to have them here
  delegate :north, :south, :east, :west, :to => :location, :prefix => false

  def kind
    self.class.to_s.downcase
  end

  def to_builder
    Jbuilder.new do |json|
      json.kind(kind)
      json.message("this object doesn't have a to_builder method")
    end
  end
end
