#comment.. test
class Customer < ActiveRecord::Base
  attr_accessible :address1, :address2, :province, :countryname, :postalcode, :email, :first_name, :last_name, :phone
  validates :first_name, :last_name, :email, :address1, :province, :countryname, :presence => {:message => 'field can\'t be blank'}
  validates :email, :uniqueness => { :message => 'email is aleady in our records.'}
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,  :message => "this email is not valid." }
  validates :phone, :format => { :with =>/^\d{3}\-\d{3}-\d{4}$/, :message=> "invalid format. try XXX-XXX-XXXX"}

end
