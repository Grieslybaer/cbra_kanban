AccountAuth::Engine.routes.draw do
  devise_for :users, class_name: AccountAuth.user_class.to_s, module: :devise
end
