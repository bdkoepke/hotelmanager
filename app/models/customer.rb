#comment.. test
class Customer < ActiveRecord::Base
  attr_accessible :address, :comment, :email, :first_name, :last_name, :phone
  validates :first_name, :last_name, :email,  :presence => {:message => 'field can\'t be blank'}
  validates :email, :uniqueness => { :message => 'email is aleady in our records.'}
  validates :email, :format => { :with => /^.+@.+$/,  :message => "this email is not valid." }
  validates :phone, :format => { :with =>/^\(\d{3}\)-\d{3}-\d{4}$/, :message=> "invalid format. try (XXX)-XXX-XXXX"}

end
