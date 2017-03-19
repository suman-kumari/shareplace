class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.text :address
      t.float :latitude
      t.float :longitude
      t.boolean :is_public, default: false, null: false
      t.timestamps null: false
    end
  end
end
