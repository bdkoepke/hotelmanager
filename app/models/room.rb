class Room < ActiveRecord::Base
  attr_accessible :bed_number, :cleaned, :comment, :room_number, :room_type
end
