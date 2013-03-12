class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :hotel_id
      t.string :room_name
      t.string :room_type
      t.integer :bed_number
      t.boolean :cleaned
      t.string :comment
      t.float :price

      t.timestamps
    end
  end
end
