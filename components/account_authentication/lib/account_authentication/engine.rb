module AccountAuthentication
  class Engine < ::Rails::Engine
    isolate_namespace AccountAuthentication

    initializer :load_decorators do
      Decorators.register! Engine.root, Rails.root
    end
  end
end
