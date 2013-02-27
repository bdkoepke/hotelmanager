# app/models/admin_ability.rb
 
# All back end users (i.e. Active Admin users) are authorized using this class
class AdminAbility
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new
 
    # We operate with three role levels:
    #  - Editor
    #  - Moderator
    #  - Manager
 
    # An editor can do the following:
    if (user.role == "admin")
      can :manage, :all
    elsif (user.role == "sales associate")
      can :manage, Customer
    end
      
  #  end
#    can :manage, AdminUser
 #   can :read, AdminUser
=begin
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