class RoomService < ActiveRecord::Base
  belongs_to :room
  belongs_to :customer
  belongs_to :reservation
  belongs_to :hotel
  attr_accessible :customer_id, :hotel_id, :order, :price, :reservation_id, :service_id, :serviced, :room_name
end
