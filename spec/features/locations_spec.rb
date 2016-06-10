require 'rails_helper'

describe "Locations API", type: :request do
  it "is well formed" do
    location = Location.create(x_coordinate: 1, y_coordinate: 1)
    wolf = Wolf.create(name: "joseph", location: location)

    get '/location?x=1&y=1'

    json = JSON.parse(response.body)

    expect(response.status).to be(200)
    expect(json['message']).not_to be_nil
    expect(json['location']).not_to be_nil
    expect(json['location']['objects']).not_to be_nil

    expect(json['location']['objects'].first['name']).to eq(wolf.name)
  end

  it "responds properly to a location that doesn't exist" do
    get '/location?x=100&y=1'

    expect(response.status).to be(404)
  end

  it "responds to a request with poorly formed parameters" do
    get '/location?x=100'

    expect(response.status).to be(400)
  end

end

# for example
# describe "Messages API" do
#   it 'sends a list of messages' do
#     FactoryGirl.create_list(:message, 10)

#     get '/api/v1/messages'

#     json = JSON.parse(response.body)

#     # test for the 200 status-code
#     expect(response).to be_success

#     # check to make sure the right amount of messages are returned
#     expect(json['messages'].length).to eq(10)
#   end
# end