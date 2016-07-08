require 'rails_helper'

describe "location helpers", type: :helper do

  before :all do
    @location = Location.create(x_coordinate: 1, y_coordinate: 2)
  end

  after :all do
    Location.destroy_all
  end

  # these tests are necessary because I've metaprogrammed over the path helper logic inside of config/routes.rb
  it "path helper works" do
    expect(locations_path(@location)).to eq("/api/v1/locations?x=1&y=2")
  end

  it "path helper works" do
    expect(url_for(@location)).to eq("/api/v1/locations?x=1&y=2")
  end
end