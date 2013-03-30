# app/models/admin_ability.rb
 
# All back end users (i.e. Active Admin users) are authorized using this class
class AdminAbility
  include CanCan::Ability
 
  def initialize(user)
#    user ||= User.new
 
    # We operate with three role levels:
    #  - Editor
    #  - Moderator
    #  - Manager
 
    # An editor can do the following:
    if (user.role == "admin")
      can :manage, :all
    elsif (user.role == "sales associate")
      can :manage, Customer
      can :manage, Room
      can :manage, Reservation
	elsif (user.role == "customer")
	  can :create, Reservation
	  can :update, Reservation, :customer_id => user.customer.id
      can :read, Reservation, :customer_id => user.customer.id
      can :destroy, Reservation, :customer_id => user.customer.id
	  can :manage, Customer, :admin_user_id => user.id
		
    end
      
=begin
    can :manage, AdminUser
    can :read, AdminUser
    # A moderator can do the following:
    if user.role('moderator')
      can :manage, :all
    end
 
    # A manager can do the following:
    if user.role?('manager')
      can :manage, :all
    end
=end
  end
end
