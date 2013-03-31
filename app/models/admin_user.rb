class AdminUser < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :customer_attributes
  has_one :customer
  has_many :reservations, :through => :customer
  accepts_nested_attributes_for :customer

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
    :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body

  def manage_reservations
		if self.role == "admin" || self.role == "sales associate"
			Reservation.reorder('id DESC')
		elsif self.role == "customer"
			reservations	
		end
  end

  def manage_customer
		if self.role == "admin" || self.role == "sales associate"
			Customer.reorder('id DESC')
		elsif self.role == "customer"
			Customer.where(:admin_user_id => self.id).reorder('id DESC')
		end
  end
end
