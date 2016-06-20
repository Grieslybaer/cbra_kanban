module AccountProfile
  class Engine < ::Rails::Engine
    isolate_namespace AccountProfile

    initializer :load_decorators do
      Decorators.register! Engine.root, Rails.root
    end
  end
end
