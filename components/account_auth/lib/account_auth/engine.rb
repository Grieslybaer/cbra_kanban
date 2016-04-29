module AccountAuth
  class Engine < ::Rails::Engine
    isolate_namespace AccountAuth
    
    initializer :load_decorators do
    	Decorators.register! Engine.root, Rails.root
    end
  end
end
