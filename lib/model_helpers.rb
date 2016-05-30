module ModelHelpers
  def kind
    self.class.to_s.downcase
  end

  # TODO: This would be a workaroudn if you can't get the AR relation doing what it ought to.
  # def location
  #   self.location_object.location
  # end
end