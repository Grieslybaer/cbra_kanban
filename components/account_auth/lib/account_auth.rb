require "devise"
require "account_auth/engine"

module AccountAuth
	# configuration for setting person (user) this account belongs to
	# works like attr_accessor
	# Important: set the value as a String for the below classes in your main app
	# => in: config/initializers/account_auth.rb
	# => example: AccountAuth.user_class = "User"
	mattr_accessor :user_class

	# overridung setter method to get Class instead of String
	def self.user_class
		error = "Please define AccountAuth.user_class in config/initializers/account_auth.rb"
		@@user_class.constantize || raise(ConfigurationNotSet, error)
	end

	# Class for Configuration Error
	class ConfigurationNotSet < StandardError

	end
end
