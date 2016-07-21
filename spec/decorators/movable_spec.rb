require 'rails_helper'

describe Movable, type: :model do
  before :all do
    @location = Location.create(x_coordinate: 2, y_coordinate: 2)
    @north_location = Location.create(x_coordinate: 2, y_coordinate: 3)

    wolf = Wolf.create(name: "joseph", location: @location)

    @movable = Movable.new(wolf)
  end

  after :all do
    Location.destroy_all
    Wolf.destroy_all
  end

  it "can be made to move in a particular direction with a couple different syntaxes" do
    @movable.move_north!
    expect(@movable.location).to eq(@north_location)
    @movable.move!("south")
    expect(@movable.location).to eq(@location)
  end

  it "can move of its own will" do
    @movable.move!
    expect(@mvoable.location).not_to eq(@location)
  end
end
