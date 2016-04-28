require "devise"
require "account_auth/engine"

module AccountAuth
	# configuration for setting person (user) this account belongs to
	# works like attr_accessor
	# Important: set the value as a String for the below classes in your main app
	# => in: config/initializers/account_auth.rb
	# => example: AccountAuth.person_class = "User"
	mattr_accessor :person_class

	# overridung setter method to get Class instead of String
	def self.person_class
		error = "Please define AccountAuth.person_class in config/initializers/account_auth.rb"
		@@person_class.constantize || raise(ConfigurationNotSet, error)
	end

	# Class for Configuration Error
	class ConfigurationNotSet < StandardError

	end
end
