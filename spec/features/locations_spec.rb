# yuhh integration testing
describe "Locations API", type: :controller do
  it "is well formed" do
    location = Location.create(x_coordinate: 1, y_coordinate: 1)
    wolf = Wolf.create(name: "joseph", location: location)

    get 'location?x=1&y=1'

    json = Json.parse(response.body)

    expect(response).to be_success
    expect(json.message).not_to be_nil
    expect(json.location).not_to be_nil
    expect(json.location.objects).not_to be_nil

    expect(json.location.objects.first.name).to eq(wolf.name)
  end
  it 'finds a location properly (happy path)'
  it "responds properly to a location that doesn't exist"
  it "responds to a request without parameters"
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