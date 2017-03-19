require "rails_helper"

describe User, type: :model do
 context "associations" do
    it { should have_many(:friendships).dependent(:destroy) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:share_places).dependent(:destroy) }
  end

  describe ".add_friend" do
    let(:user)        { create(:user) }
    let(:friend)      { create(:user) }
    let!(:friendship) { create(:friendship, friend_id: friend.id, user_id: user.id)}

    context "when user_id and friend_id is same" do
      it "should return error" do
        expect(user.add_friend(user)).to eq(["User '#{user.email}' already exists in the user's friendship list."])
      end
    end

    context "when friend_id and user_id is different" do
      before :each do
        user.add_friend(friend)
      end

      it "should create frienship" do
        expect(user.friendships).to include(friendship)
      end

      it "should create friend" do
        expect(user.friends).to include(friend)
      end
    end
  end
end
