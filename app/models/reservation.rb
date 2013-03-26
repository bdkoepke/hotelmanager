class Reservation < ActiveRecord::Base
  belongs_to :room
  # TODO: are there possibly multiple customers to one room?
  belongs_to :customer
  belongs_to :hotel

  attr_accessible  :hotel_id , :room_id, :customer_id, :date_in, :date_out, :rate_additional, :no_adults, :no_children, :comment, :room_type
  #attr_accessible :room, :customer, :date_in, :date_out, :rate_additional, :no_adults, :no_children, :comment

  validates :room_id, :uniqueness => { :scope => :hotel_id, :scope => :date_in, :scope => :date_out, :message => 'Room is is already in our records' }
  validates :rate_additional, :price => true
  validates_date :date_in, :on_or_after => lambda { Date.current }
  validates_date :date_out, :after => lambda { :date_in }
  validates_presence_of :room_id, :customer_id, :date_in, :date_out, :no_adults, :no_children, :hotel_id,:room_type
  #validates :no_adults, :numericality => { :less_than_or_equal_to => lambda { |r| r.room.bed_number} }
  validates :no_adults, :numericality => { :less_than_or_equal_to => lambda { |r| r.room.try(:bed_number)} , :message => 'Number of people exceeds room capacity'},
            :unless => Proc.new {|r| r.room.nil? }
# validates :age_min, :numericality => {greater_than: 0, less_than_or_equal_to: :age_max}, :unless => Proc.new {|user| user.age_min.nil? || user.age_max.nil? }

end
