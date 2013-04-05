class Reservation < ActiveRecord::Base
  belongs_to :room
  # TODO: are there possibly multiple customers to one room?
  belongs_to :customer
  belongs_to :hotel
  has_one :invoice, :dependent => :delete
  has_many :room_service
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
# validates :age_min, :numericality => {greater_than: 0, less_than_or_equal_to: :age_max}, :unless => Proc.new {|user| user.age_min.nil? || user.age_max.nil? }

  #validate :dates_must_not_overlap

#before_validation :add_correct_time_to_date

#def add_correct_time_to_date
#  self.date_start = self.date_start.beginning_of_day
#  self.date_end = self.date_end.end_of_day
#end

def validate
  self.errors.add_to_base("Invalid date range") if self.date_in > self.date_out or self.date_out < self.date_in
end

def dates_must_not_overlap
  # if i'm editing a record, don't include itself in the overlap check
  if self.new_record?
    overlapping_reservations = Reservation.find(:all, :conditions => ["(? > date_in and ? < date_out) or (? > date_in and ? < date_out)", self.date_in, self.date_in, self.date_out, self.date_out])
  else
    overlapping_reservations = Reservation.find(:all, :conditions => ["((? > date_in and ? < date_out) or (? > date_in and ? < date_out)) and id != ?", self.date_in, self.date_in, self.date_out, self.date_out, self.id])
  end
 
  #if it found overlapping events, throw an error
  if overlapping_reservations.size > 0
    reservation_ids = []
    for event in overlapping_reservations
      reservation_ids << reservation.id
    end
    errors.add_to_base("Date range overlaps with these events: #{event_titles.join(', ')}")
  end
end

end
