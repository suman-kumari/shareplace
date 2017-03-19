require "rails_helper"

describe Place, type: :model do
  context "scopes" do
    describe ".are_public" do
      let!(:public_place)  { create(:place) }
      let!(:private_place) { create(:place, is_public: false) }

      it "should return places that are public" do
        expect(Place.are_public).to include(public_place)
      end

      it "should not return places that are private" do
        expect(Place.are_public).not_to include(private_place)
      end
    end
  end
end
