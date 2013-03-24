class AddRoomTypeToReservation < ActiveRecord::Migration
  def change
	  add_column :reservations, :room_type, :String
  end
end
