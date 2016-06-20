require "devise"
require "decorators"
require "account_authentication/engine"

module AccountAuthentication
  # configuration for setting person (user) this account belongs to
  # works like attr_accessor
  # Important: set the value as a String for the below classes in your main app
  # => in: config/initializers/account_auth.rb
  # => example: AccountAuth.user_class = "User"
  mattr_accessor :user_class
  
  mattr_accessor :after_sign_up_path

  # overridung setter method to get Class instead of String
  def self.user_class
    @@user_class.constantize if @@user_class.present?
  end
end
