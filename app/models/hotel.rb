class Hotel < ActiveRecord::Base
  has_many :rooms
  # TODO: proper validation for country, postal code, province
  attr_accessible :address1, :address2, :countryname, :email, :name, :phone, :postalcode, :province
  validates :name, :phone, :email, :address1, :countryname, :province, :presence => true
  validates :name, :uniqueness => { :message => 'Hotel name is aleady in our records.'}
  validates :email, :email => true, :uniqueness => { :message => 'Email is already in our records.' }
  validates :phone, :phone => true
end
