class Room < ActiveRecord::Base
	belongs_to :hotel
  attr_accessible :bed_number, :cleaned, :comment, :hotel_id, :room_name, :room_type, :price
end
