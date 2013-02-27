class User < ActiveRecord::Base
	has_many :assignments
	has_many :roles, :through => :assignments

	def has_role?(role)
		roles.any? { |r| r.name.underscore.to_sym == role }
	end
end
