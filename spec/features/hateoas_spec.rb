require 'rails_helper'

describe "HATEOAS", type: :request do
  before :all do
    @location = Location.create(x_coordinate: 2, y_coordinate: 2)

    # all locations adjacent to @location
    Location.create(x_coordinate: 2, y_coordinate: 3)
    Location.create(x_coordinate: 2, y_coordinate: 1)
    Location.create(x_coordinate: 3, y_coordinate: 2)
    Location.create(x_coordinate: 1, y_coordinate: 2)

    @wolf = Wolf.create(name: "joseph", location: @location)

    get '/api/v1/location?x=2&y=2'
    @json = JSON.parse(response.body)
    @actions = @json['data']['location']['actions']
  end

  context "location actions" do
    it "go north" do
      get @actions['north_url']
      expect(response.status).to eq(200)
      new_json = JSON.parse(response.body)
      expect(new_json['data']['location']['x']).to eq(2)
      expect(new_json['data']['location']['y']).to eq(3)
    end

    it "go south" do
      get @actions['south_url']
      expect(response.status).to eq(200)
      new_json = JSON.parse(response.body)
      expect(new_json['data']['location']['x']).to eq(2)
      expect(new_json['data']['location']['y']).to eq(1)
      expect(new_json['data']['location']['actions']['south']).to be(nil)
    end

    it "go east" do
      get @actions['east_url']
      expect(response.status).to eq(200)
      new_json = JSON.parse(response.body)
      expect(new_json['data']['location']['x']).to eq(3)
      expect(new_json['data']['location']['y']).to eq(2)
    end

    it "go west" do
      get @actions['west_url']
      expect(response.status).to eq(200)
      new_json = JSON.parse(response.body)
      expect(new_json['data']['location']['x']).to eq(1)
      expect(new_json['data']['location']['y']).to eq(2)
      expect(new_json['data']['location']['actions']['west']).to be(nil)
    end
  end

  it "object actions"
  #   wolf = @json['data']['location']['objects'].first
  #   get wolf['actions']['details']
  #   expect(response).to be(200)
  # end
end
