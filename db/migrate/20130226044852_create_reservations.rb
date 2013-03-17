class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :room_id
			t.integer :customer_id
      t.date :date_in
      t.date :date_out
      t.float :rate_daily
      t.float :rate_additional
      t.integer :no_adults
      t.integer :no_children
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
