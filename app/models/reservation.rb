class Reservation < ActiveRecord::Base
  belongs_to :room
  # TODO: are there possibly multiple customers to one room?
  belongs_to :customer
  belongs_to :hotel
  has_one :invoice, :dependent => :delete
  has_many :room_services
  after_create :build_invoice

# define scopes for activeadmin
scope :checked_in, where("status = 'Checked-in'")
scope :checked_out, where("status = 'Checked-out'")
  
def build_invoice
  #if( self.room != nil && self.id != nil && self.rate_additional != nil)
	 self.invoice = Invoice.create(:reservation_id => self.id)
  #end 
end 
  attr_accessible  :hotel_id , :room_id, :customer_id, :date_in, :date_out, :rate_additional, :no_adults, :no_children, :comment, :room_type
  #attr_accessible :room, :customer, :date_in, :date_out, :rate_additional, :no_adults, :no_children, :comment

  #validates :room_id, :dates_must_not_overlap =>'Room is is already in our records' 
  validates :rate_additional, :price => true
  validates_date :date_in, :on_or_after => lambda { Date.current }
  validates_date :date_out, :after => lambda { :date_in }
  validates_presence_of :room
  validates_presence_of :room_id, :customer_id, :date_in, :date_out, :no_adults, :no_children, :hotel_id,:room_type
  #validates :no_adults, :numericality => { :less_than_or_equal_to => lambda { |r| r.room.bed_number} }
  validates :no_adults, :numericality => { :less_than_or_equal_to => lambda { |r| r.room.try(:bed_number)} , :message => 'Number of people exceeds room capacity'},
            :unless => Proc.new {|r| r.room.nil? }

	validate :overlaps?

	def overlaps?
		overlap = Reservation.where('room_id == ? AND date_out > ? AND date_in < ?', room_id, date_in, date_out).count > 0

		if overlap
			errors.add(:date_in, 'Overlaps with another reservation')
			errors.add(:date_out, 'Overlaps with another reservation')
		end

		return overlap
	end
end
