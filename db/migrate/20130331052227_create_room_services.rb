class CreateRoomServices < ActiveRecord::Migration
  def change
    create_table :room_services do |t|
      t.integer :service_id
      t.integer :customer_id
      t.integer :reservation_id
      t.string :hotel_id
      t.integer :room_id
      t.boolean :serviced
      t.string :order
      t.float :price
      t.date :service_date
      t.timestamps
    end
  end
end
