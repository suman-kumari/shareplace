class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend
  has_many :share_places, dependent: :destroy

  def add_friend(friend)
    if friend.id != self.id
      friendship = friendships.build(friend_id: friend.id)
      friendship.save
    else
      errors.add(:base, "User '#{friend.email}' already exists in the user's friendship list.")
    end
  end
end
