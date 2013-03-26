class CreateRoomservices < ActiveRecord::Migration
  def change
    create_table :roomservices do |t|
      t.string :order
      t.float :price
      t.boolean :serviced
      t.string :customer_name
      t.string :room_name
      t.string :hotel_name
      t.timestamps
    end
  end
end
