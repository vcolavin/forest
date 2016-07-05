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
  end

  it "location actions (movements)" do
    actions = @json['data']['location']['actions']

    get actions['north']
    expect(response.status).to eq(200)
    json = JSON.parse(response.body)
    expect(json['data']['location']['x']).to eq(2)
    expect(json['data']['location']['y']).to eq(3)


    get actions['south']
    expect(response.status).to eq(200)
    json = JSON.parse(response.body)
    expect(json['data']['location']['x']).to eq(2)
    expect(json['data']['location']['y']).to eq(1)
    expect(json['data']['location']['actions']['south']).to be(nil)


    get actions['east']
    expect(response.status).to eq(200)
    json = JSON.parse(response.body)
    expect(json['data']['location']['x']).to eq(3)
    expect(json['data']['location']['y']).to eq(2)


    get actions['west']
    expect(response.status).to eq(200)
    json = JSON.parse(response.body)
    expect(json['data']['location']['x']).to eq(1)
    expect(json['data']['location']['y']).to eq(2)
    expect(json['data']['location']['actions']['west']).to be(nil)
  end

  context "object actions" do
    wolf = @json['data']['location']['objects'].first

    get wolf['actions']['details']
    expect(response).to be(200)
  end
end
