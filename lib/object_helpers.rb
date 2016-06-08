module ObjectHelpers
  def kind
    self.class.to_s.downcase
  end

  # this method is hopefully overwritten by every model
  # TODO: Maybe this shouldn't be here, as it suppresses a useful error?
  def to_builder
    Jbuilder.new do |json|
      json.kind(kind)
    end
  end
end