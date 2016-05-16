module KanbanBoard
  class Engine < ::Rails::Engine
    isolate_namespace KanbanBoard

    initializer :append_migrations do |app|
    	unless app.root.to_s.match(root.to_s)
    		config.paths["db/migrate"].expanded.each do |p|
    			app.config.paths["db/migrate"] << p
    		end
    	end
    end

    initializer :load_decorators do
        Decorators.register! Engine.root, Rails.root
    end
  end
end
