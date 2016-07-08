require 'rails_helper'

describe LocationPresenter do
  before :all do
    location = Location.create(x_coordinate: 2, y_coordinate: 1)

    @north_location = Location.create(x_coordinate: 2, y_coordinate: 2)
    @east_location = Location.create(x_coordinate: 1, y_coordinate: 1)
    @west_location = Location.create(x_coordinate: 3, y_coordinate: 1)

    @location_presenter = LocationPresenter.new(location)
    Wolf.create(name: "joseph", location: location)
  end

  after :all do
    Location.destroy_all
    Wolf.destroy_all
  end

  it "returns directional URLs" do
    expect(@location_presenter.north_url).to eq(url_for(@north_location))
    expect(@location_presenter.east_url).to eq(url_for(@east_location))
    expect(@location_presenter.west_url).to eq(url_for(@west_location))
  end

  it "returns nil for an impossible direction" do
    expect(@location_presenter.south_url).to be(nil)
  end

  it "collects actions into hash" do

  end

  it "collects object attributes into hash" do
  end
end