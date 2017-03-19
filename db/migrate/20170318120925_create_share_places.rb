class CreateSharePlaces < ActiveRecord::Migration
  def change
    create_table :share_places do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.integer :place_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :share_places, :users
    add_foreign_key :share_places, :users, column: :friend_id
    add_foreign_key :share_places, :places
    add_index :share_places, [:user_id, :friend_id, :place_id], :unique => true
  end
end
