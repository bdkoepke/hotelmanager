class RoomService < ActiveRecord::Base
  belongs_to :room
  belongs_to :customer
  belongs_to :reservation
  belongs_to :hotel
  attr_accessible :customer_id, :hotel_id, :order, :price, :registration_id, :reservation_id, :service_id, :serviced, :room_id

validates :hotel_id, :order, :presence => {:message => 'Field Cannot Be Blank'}
validates :serviced, :inclusion => { :in => [true, false], :message => 'Field cannot be blank'}
validates :price, :price => true
end
