class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many :reservations

  attr_accessible :bed_number, :cleaned, :comment, :hotel_id, :name, :room_type, :price

  validates :bed_number, :hotel_id, :name, :room_type, :presence => {:message => 'Field Cannot Be Blank'}
  validates :name, :uniqueness => { :scope => :hotel_id, :message => 'Room name combined with Hotel ID must be unique.'}
  validates :price, :price => true
  validates :cleaned, :inclusion => { :in => [true, false], :message => 'Field cannot be blank'}
end
