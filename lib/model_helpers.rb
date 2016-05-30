module ModelHelpers
  def kind
    self.class.to_s.downcase
  end
end