class Roomservice < ActiveRecord::Base
  belongs_to :reservation
  
  attr_accessible ,:customer_name, :room_number, :order, :price, :serviced,
end
