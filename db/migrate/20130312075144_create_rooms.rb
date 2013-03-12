class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.string :room_type
      t.integer :bed_number
      t.boolean :cleaned
      t.string :comment

      t.timestamps
    end
  end
end
