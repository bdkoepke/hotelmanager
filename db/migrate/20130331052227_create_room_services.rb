class CreateRoomServices < ActiveRecord::Migration
  def change
    create_table :room_services do |t|
      t.integer :reservation_id
      t.string :hotel_id
      t.integer :room_id
      t.boolean :serviced
      t.string :order
      t.float :price
      t.timestamps
    end
  end
end
