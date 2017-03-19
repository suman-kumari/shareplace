require 'rails_helper'

describe Friendship, type: :model do
  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end

  context "validations" do
    let(:user)        { create(:user) }
    let(:friend)      { create(:friend) }
    let!(:friendship) { create(:friendship, friend_id: friend.id, user_id: user.id) }

    it{ should validate_presence_of(:friend_id) }
    it{ should validate_presence_of(:user_id) }

    it "validates uniqueness of friend_id" do
      should validate_uniqueness_of(:friend_id).scoped_to(:user_id)
    end
  end
end
