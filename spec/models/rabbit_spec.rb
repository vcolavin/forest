require 'rails_helper'

describe Rabbit, type: :model do
  before :all do
    @location = Location.create(x_coordinate: 1, y_coordinate: 1)
    @rabbit = Rabbit.create(location: @location)
  end

  after :all do
    Location.destroy_all
    Rabbit.destroy_all
  end

  it "should have a location" do
    expect(@rabbit.location).to be(@location)
  end
end
