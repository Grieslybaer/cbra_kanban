AccountAuth::Engine.routes.draw do
  devise_for :users, class_name: "AccountAuth::User", module: :devise
end
