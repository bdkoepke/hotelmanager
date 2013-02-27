class Ability
  include CanCan::Ability

  def initialize(user)
		# guest user
		user ||= User.new
		#if user.has_role? :admin
=begin
		if (current_user.role == "admin")
			can :manage, :all
		else
=end
			can :read, :all
#		end
  end
end
