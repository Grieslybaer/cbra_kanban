module KanbanBoardUi
  class Engine < ::Rails::Engine
    isolate_namespace KanbanBoardUi

    initializer :load_decorators do
        Decorators.register! Engine.root, Rails.root
    end
  end
end
