require 'spec_helper'

describe "Location" do
  before :all do
    @location = Location.create(x_coordinate: 1, y_coordinate: 1)
    @wolf = Wolf.create(name: "Johnny", location: @location)
    @tree = Tree.create(number_of_branches: 4, location: @location)
  end

  it {should have_many :objects}

  it "should be associated to a wolf" do
    @location.objects.should include @wolf
    @location.objects.should include @tree
  end

  it "should have methods for scoping specific locatable objects" do
    @location.wolves.should be [@wolf]
    @location.trees.should be [@tree]
  end
end
