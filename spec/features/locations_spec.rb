# yuhh integration testing
describe "GET Location" do
  it 'finds a location properly (happy path)'
  it "is well formed; i.e. has the layout"
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