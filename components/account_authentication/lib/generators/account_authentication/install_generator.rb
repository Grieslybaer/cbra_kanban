require "rails/generators"
module AccountAuthentication
	module Generators
		class InstallGenerator < Rails::Generators::Base
  		source_root File.expand_path('../install/templates', __FILE__)

  		def add_account_authentication_initializer
  			path = "#{Rails.root}/config/initializers/account_authentication.rb"
        if File.exists?(path)
          puts "Skipping initializer (config/initializers/account_authentication.rb), as file already exists!"
        else
          puts "Adding initializer (config/initializers/account_authentication.rb)"
          template "initializer.rb", path
          require path
        end
  		end

      def mount_account_authentication_in_routes
        puts "Mounting Engine in config/routes.rb: mount AccountAuthentication::Engine, at: \"/account\""
        insert_into_file "#{Rails.root}/config/routes.rb", after: /routes.draw do\n/ do
          %Q{
  # Mount AccountAuthentication::Engine to given path
  mount AccountAuthentication::Engine, at: '/account', as: 'account_auth'
          }
        end
      end
		end
	end
end
