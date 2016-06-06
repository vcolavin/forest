module ModelHelpers
  def kind
    self.class.to_s.downcase
  end

  # this method is hopefully overwritten by every model
  def to_builder
    Jbuilder.new do |json|
      json.kind(kind)
    end
  end
end