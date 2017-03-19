class SharePlace < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_id'
  belongs_to :place

  validates_presence_of :friend_id, :user_id, :place_id
  validates_uniqueness_of :place_id, scope: [:user_id, :friend_id]

  scope :user_or_friend, ->(user) { where("user_id = ? or friend_id = ?", user.id, user.id) }
end
