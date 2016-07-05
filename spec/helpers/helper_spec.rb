require 'rails_helper'

describe "location url and path helpers", type: :helper do

  before :all do
    @location = Location.create(x_coordinate: 1, y_coordinate: 2)
  end

  # these tests are necessary because I've metaprogrammed over the path helper logic inside of config/routes.rb
  it "location path helper works" do
    extend Rails.application.routes.url_helpers
    expect(location_path(@location)).to eq("/api/v1/location?x=1&y=2")
  end

  it "location url helper works" do
    extend Rails.application.routes.url_helpers
    expect(url_for(@location)).to eq("/api/v1/location?x=1&y=2")
  end
end