class Hotel < ActiveRecord::Base
  attr_accessible :address1, :address2, :countryname, :email, :name, :phone, :postalcode, :province
  validates :name, :phone, :email, :address1, :countryname, :province, :presence => true
  validates :name, :uniqueness => { :message => 'that hotel name  is aleady in our records.'}
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,  :message => "this email is not valid." }
  validates :phone, :format => { :with =>/^\d{3}\-\d{3}-\d{4}$/, :message=> "invalid format. try XXX-XXX-XXXX"}
end
