require 'rails_helper'

describe Wolf, type: :model do
  before :all do
    @location = Location.create(x_coordinate: 1, y_coordinate: 1)
    @wolf = Wolf.create(name: "Johnny", location: @location)
  end

  after :all do
    Location.destroy_all
    Wolf.destroy_all
  end

  it {should have_one :location}

  it "should have a location" do
    expect(@wolf.location).to be(@location)
  end
end
