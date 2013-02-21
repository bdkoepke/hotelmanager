class Customer < ActiveRecord::Base
  attr_accessible :address, :comment, :email, :first_name, :last_name, :phone
end
