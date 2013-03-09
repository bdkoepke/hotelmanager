class Hotel < ActiveRecord::Base
  attr_accessible :address1, :address2, :countryname, :email, :name, :phone, :postalcode, :province
  validates :name, :phone, :address1, :countryname, :province, :postalcode, :presence => true

end
