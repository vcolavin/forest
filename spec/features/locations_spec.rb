require 'rails_helper'

describe "Locations API", type: :request do
  it "is well formed" do
    location = Location.create(x_coordinate: 1, y_coordinate: 1)
    wolf = Wolf.create(name: "joseph", location: location)

    get '/api/v1/location?x=1&y=1'

    json = JSON.parse(response.body)

    expect(response.status).to be(200)

    expect(json['message']).not_to be_nil
    expect(json['data']['location']).not_to be_nil
    expect(json['data']['location']['objects']).not_to be_nil

    expect(json['data']['location']['objects'].first['name']).to eq(wolf.name)
  end

  it "responds properly to a location that doesn't exist" do
    get '/api/v1/location?x=100&y=1'

    expect(response.status).to be(404)
  end

  it "responds to a request with poorly formed parameters" do
    get '/api/v1/location?x=100'

    expect(response.status).to be(400)
  end

end
