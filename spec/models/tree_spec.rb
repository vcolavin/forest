require 'spec_helper'

describe Tree do
  before :all do
    @location = Location.create(x_coordinate: 1, y_coordinate: 1)
    @tree = Tree.create(number_of_branches: 4, location: @location)
  end

  it {should have_one :location}

  it "should have a location" do
    expect(@tree.location).to be(@location)
  end
end
