require 'rails_helper'

describe Location, type: :model do

  it { is_expected.to have_many(:location_objects) }

  context 'validations' do
    it "should create a location" do
      location = Location.new(x_coordinate: 1, y_coordinate: 2)
      expect(location).to be_valid
    end

    it "should not create a location with neither coordinates" do
      location = Location.new()
      expect(location).not_to be_valid
      expect(location.errors.full_messages).to include("X coordinate can't be blank")
      expect(location.errors.full_messages).to include("Y coordinate can't be blank")
    end

    it "should not create a location with only one coordinate" do
      location = Location.new(x_coordinate: 1)
      expect(location).not_to be_valid
      expect(location.errors.full_messages).to include("Y coordinate can't be blank")
    end

    it "should not create a location with non-unique coordinates" do
      location_1 = Location.create(x_coordinate: 1, y_coordinate: 2)
      location_2 = Location.create(x_coordinate: 1, y_coordinate: 2)

      expect(location_2).to be_invalid
      expect(location_2.errors.full_messages).to include("Coordinates must be unique")
    end
  end

  context 'associations' do
    let!(:location) { Location.create(x_coordinate: 2, y_coordinate: 2) }

    context 'directions' do
      let!(:north_location) { Location.create(x_coordinate: 2, y_coordinate: 3) }
      let!(:south_location) { Location.create(x_coordinate: 2, y_coordinate: 1) }
      let!(:east_location) { Location.create(x_coordinate: 3, y_coordinate: 2) }
      let!(:west_location) { Location.create(x_coordinate: 1, y_coordinate: 2) }

      it "should have cardinal direction methods that return locations" do
        expect(location.north).to eq(north_location)
        expect(location.south).to eq(south_location)
        expect(location.east).to eq(east_location)
        expect(location.west).to eq(west_location)
      end

      it "should not return locations for directions that do not exist" do
        expect(south_location.south).to eq(nil)
        expect(west_location.west).to eq(nil)
      end
    end

    context 'objects' do
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
end
