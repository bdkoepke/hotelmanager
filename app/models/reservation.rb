class Reservation < ActiveRecord::Base
  attr_accessible :hotel_name, :room_no, :first_name, :last_name, :date_in, :date_out, :rate_daily, :rate_additional, :no_adults, :no_children, :comment
  validates_date :date_in,  :on_or_after => lambda { Date.current } 
  validates_date :date_out, :after => lambda { :date_in}
  
 validates_presence_of :hotel_name, :room_no , :first_name, :last_name, :date_in, :date_out , :rate_daily, :no_adults, :no_children
end
