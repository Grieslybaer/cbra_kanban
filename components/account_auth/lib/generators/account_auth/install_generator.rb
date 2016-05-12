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

      def mount_account_auth_in_routes
        puts "Mounting Engine in config/routes.rb: mount AccountAuth::Engine, at: \"/account\""
        insert_into_file "#{Rails.root}/config/routes.rb", after: /routes.draw do\n/ do
          %Q{
  # Mount AccountAuth::Engine to given path
  mount AccountAuth::Engine, at: '/account', as: 'account_auth'
          }
        end
      end
		end
	end
end
