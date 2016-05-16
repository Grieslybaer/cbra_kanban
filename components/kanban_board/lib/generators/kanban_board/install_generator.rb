require "rails/generators"
module KanbanBoard
	module Generators
		class InstallGenerator < Rails::Generators::Base
  		source_root File.expand_path('../install/templates', __FILE__)

  		def add_kanban_board_initializer
  			path = "#{Rails.root}/config/initializers/kanban_board.rb"
        if File.exists?(path)
          puts "Skipping initializer (config/initializers/kanban_board.rb), as file already exists!"
        else
          puts "Adding initializer (config/initializers/kanban_board.rb)"
          template "initializer.rb", path
          require path
        end
  		end
		end
	end
end