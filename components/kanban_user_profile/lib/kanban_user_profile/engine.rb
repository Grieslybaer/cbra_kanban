module KanbanUserProfile
  class Engine < ::Rails::Engine
    isolate_namespace KanbanUserProfile

    initializer :load_decorators do
    	Decorators.register! Engine.root, Rails.root
    end
  end
end
