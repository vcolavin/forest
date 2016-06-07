require 'rails_helper'

describe Location, type: :model do

  it { is_expected.to have_many(:location_objects) }

  context 'with a wolf and tree' do
    let!(:location) { Location.create(x_coordinate: 99999, y_coordinate: 99999) }
    let!(:wolf) { Wolf.create(name: "Johnny", location: location) }
    let!(:tree) { Tree.create(number_of_branches: 4, location: location) }

    it "should be associated to locatable objects" do
      expect(location.objects).to include(wolf)
      expect(location.objects).to include(tree)
    end

    it "should have methods for scoping specific locatable objects" do
      expect(location.wolves).to match_array([wolf])
      expect(location.trees).to match_array([tree])
    end
  end
end
