class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  validates_presence_of :friend_id, :user_id
  validates_uniqueness_of :friend_id, scope: [:user_id]
end
