class Room < ActiveRecord::Base
	belongs_to :hotel
	has_many :reservations
  attr_accessible :bed_number, :cleaned, :comment, :hotel_id, :name, :room_type, :price
  validates :bed_number, :hotel_id, :name, :room_type, :presence => {:message => 'Field Cannot Be Blank'}
  validates :name, :uniqueness => { :scope => :hotel_id, :message => 'Room name combined with Hotel ID must be unique.'}
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ ,:message => 'Invalid Format. Try xx.xx'}, :numericality => {:greater_than_or_equal_to => 0}
  validates :cleaned, :inclusion => { :in => [true, false], :message => 'Field Cannot Be Blank'}
end
