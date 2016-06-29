require 'rails_helper'

describe "Locations API", type: :request do
  context "is well formed" do
    before :all do
      @location = Location.create(x_coordinate: 1, y_coordinate: 2)
      @wolf = Wolf.create(name: "joseph", location: @location)

      get '/api/v1/location?x=1&y=2'
      @json = JSON.parse(response.body)
    end

    it "message and data" do
      expect(response.status).to eq(200)
      expect(@json['message']).not_to be_nil
      expect(@json['data']).not_to be_nil
    end

    it "location" do
      location = @json['data']['location']

      expect(location).not_to be_nil
      expect(location['x']).to eq(1)
      expect(location['y']).to eq(2)

      expect(location['actions']).not_to be_nil

      expect(location['objects']).not_to be_nil
      expect(location['objects'].count).to eq(1)
    end

    it "wolf" do
      wolf = @json['data']['location']['objects'].first
      expect(wolf['name']).to eq(@wolf.name)
      expect(wolf['kind']).to eq('wolf')

      expect(wolf['actions']).not_to be_nil
      expect(wolf['actions']['details']).not_to be_nil
    end
  end

  it "responds properly to a location that doesn't exist" do
    get '/api/v1/location?x=100000&y=1'

    expect(response.status).to eq(404)
  end

  it "responds to a request with poorly formed parameters" do
    get '/api/v1/location?x=1'

    expect(response.status).to eq(400)
  end
end
