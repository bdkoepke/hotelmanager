class Hoteltoreservation < ActiveRecord::Migration
def change
	add_column :reservations, :hotel_id, :integer
  end

end
