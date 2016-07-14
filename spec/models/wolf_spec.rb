require 'rails_helper'

describe Wolf, type: :model do
  before :all do
    @location = Location.create(x_coordinate: 1, y_coordinate: 1)
    @north_location = Location.create(x_coordinate: 1, y_coordinate: 2)
    @wolf = Wolf.create(name: "Johnny", location: @location)
  end

  after :all do
    Location.destroy_all
    Wolf.destroy_all
  end

  it "should have a location" do
    expect(@wolf.location).to eq(@location)
  end

  context "movement methods" do
    it "should be able to move" do
      @wolf.go_north!
      expect(@wolf.location).to eq(@north_location)
    end

    it "should not be able to move off the map" do
      @wolf.go_west!
      expect(@wolf.location).to eq(@location)
    end
  end
end
