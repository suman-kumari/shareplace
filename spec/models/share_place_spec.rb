require "rails_helper"

describe SharePlace, type: :model do
  context "Validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:friend_id) }
    it { should validate_presence_of(:place_id) }
  end

  context "scopes" do
    describe ".user_or_friend" do
      let(:user)          { create(:user) }
      let(:other_user)    { create(:user) }
      let(:friend)        { create(:friend) }
      let(:place)         { create(:place) }
      let!(:share_place1) { create(:share_place, user_id: user.id, friend_id: friend.id, place_id: place.id) }
      let!(:share_place2) { create(:share_place, user_id: other_user.id, friend_id: friend.id, place_id: place.id) }

      it "should return the places either shared by user or any friends have shared with user" do
        expect(SharePlace.user_or_friend(user)).to include(share_place1)
      end

      it "should not return places shared with other people" do
        expect(SharePlace.user_or_friend(user)).not_to include(share_place2)
      end
    end
  end
end
