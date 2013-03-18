class Reservation < ActiveRecord::Base
	belongs_to :room
	# TODO: are there possibly multiple customers to one room?
	belongs_to :customer

  attr_accessible :room_id, :customer_id, :date_in, :date_out, :rate_additional, :no_adults, :no_children, :comment
  validates :rate_additional, :numericality => {:greater_than_or_equal_to => 0}
  validates_date :date_in,  :on_or_after => lambda { Date.current } 
  validates_date :date_out, :after => lambda { :date_in}
  
  validates_presence_of :room_id, :customer_id, :date_in, :date_out, :no_adults, :no_children
end
