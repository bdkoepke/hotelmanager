class Ability
  include CanCan::Ability

  def initialize(user)
		# guest user
		user ||= User.new
<<<<<<< HEAD
		if user.has_role? :admin
			can :manage, :all
		else
			can :read, :all
		end
=======
		#if user.has_role? :admin
=begin
		if (current_user.role == "admin")
			can :manage, :all
		else
=end
			can :read, :all
#		end
>>>>>>> 0456d704fc81140d9e461b4d934b862b91815b5e
  end
end
