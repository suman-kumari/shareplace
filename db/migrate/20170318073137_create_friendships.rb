class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id, :null => false
      t.integer :friend_id, :null => false
      t.timestamps null: false
    end

    add_foreign_key :friendships, :users
    add_foreign_key :friendships, :users, column: :friend_id
    add_index :friendships, [:user_id, :friend_id], :unique => true
  end
end
