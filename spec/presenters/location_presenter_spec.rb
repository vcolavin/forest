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

  it "has coordinate shortcut methods" do
    expect(@location_presenter.x).to eq(2)
    expect(@location_presenter.y).to eq(1)
  end

  it "returns directional URLs" do
    expect(@location_presenter.north_url).to eq("/api/v1/locations?x=2&y=2")
    expect(@location_presenter.east_url).to eq("/api/v1/locations?x=3&y=1")
    expect(@location_presenter.west_url).to eq("/api/v1/locations?x=1&y=1")
  end

  it "returns nil for an impossible direction" do
    expect(@location_presenter.south_url).to be(nil)
  end

  it "collects actions into hash" do
    actions = @location_presenter.actions

    expect(actions).to be_a(Hash)

    expect(actions["north_url"]).not_to be(nil)
    expect(actions["east_url"]).not_to be(nil)
    expect(actions["west_url"]).not_to be(nil)
    expect(actions["south_url"]).to be(nil)
  end

  it "collects object attributes into array of hashes" do
    object_attributes = @location_presenter.object_attributes

    expect(object_attributes).to be_an(Array)
    expect(object_attributes.first["kind"]).to eq("wolf")
  end
end