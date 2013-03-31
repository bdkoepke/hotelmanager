#comment.. test
class Customer < ActiveRecord::Base
  has_many :reservations
  has_many :room_services
  # TODO: proper validation for province, country, postal code
  attr_accessible :address1, :address2, :province, :countryname, :postalcode, :email, :first_name, :last_name, :phone
  validates :first_name, :last_name, :email, :address1, :province, :countryname, :presence => {:message => 'Field can\'t be blank'}
  validates :email, :email => true, :uniqueness => { :message => 'Email is already in our records.' }
  validates :phone, :phone => true

  def name()
    return first_name + " " + last_name
  end
end
