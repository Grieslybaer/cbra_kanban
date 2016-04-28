require "rails/generators"
module AccountAuth
	module Generators
		class InstallGenerator < Rails::Generators::Base
  		source_root File.expand_path('../install/templates', __FILE__)

  		def add_account_auth_initializer
  			path = "#{Rails.root}/config/initializers/account_auth.rb"
        if File.exists?(path)
          puts "Skipping initializer (config/initializers/account_auth.rb), as file already exists!"
        else
          puts "Adding initializer (config/initializers/account_auth.rb)"
          template "initializer.rb", path
          require path
        end
  		end
		end
	end
end
