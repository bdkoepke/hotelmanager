class Reservation < ActiveRecord::Base
  attr_accessible :hotel_name, :room_no, :first_name, :last_name, :date_in, :date_out, :rate_daily, :rate_additional, :no_adults, :no_children, :comment
  
end
