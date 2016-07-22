require 'rails_helper'

describe Movable, type: :model do
  before :all do
    @location = Location.create(x_coordinate: 2, y_coordinate: 2)
    @north_location = Location.create(x_coordinate: 2, y_coordinate: 3)
    @south_location = Location.create(x_coordinate: 2, y_coordinate: 1)
    @east_location = Location.create(x_coordinate: 3, y_coordinate: 2)
    @west_location = Location.create(x_coordinate: 1, y_coordinate: 2)

    wolf = Wolf.create(name: "joseph", location: @location)

    @movable = Movable.new(wolf)
  end

  before :each do
    @movable.location = @location
  end

  after :all do
    Location.destroy_all
    Wolf.destroy_all
    Tree.destroy_all
  end

  xit "shouldn't be able to decorate immovable objects" do
    tree = Tree.create(number_of_branches: 1, location: @location)

    expect(Movable.new(tree)).to throw(SomeError)
  end

  it "can move north" do
    @movable.move_north!
    expect(@movable.location).to eq(@north_location)
  end

  it "can move south" do
    @movable.move_south!
    expect(@movable.location).to eq(@south_location)
  end

  it "can move east" do
    @movable.move_east!
    expect(@movable.location).to eq(@east_location)
  end

  it "can move west" do
    @movable.move_west!
    expect(@movable.location).to eq(@west_location)
  end

  it "can't be made to move to a location that doesn't exist" do
    @movable.move_south!
    @movable.move_south!

    expect(@movable.location).to eq(@south_location)
  end

  it "can move of its own will" do
    @movable.move!
    expect(@movable.location).not_to eq(@location)
  end
end
