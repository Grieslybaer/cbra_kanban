AccountAuthentication::Engine.routes.draw do
  if AccountAuthentication.user_class.present?
    devise_for :users, class_name: AccountAuthentication.user_class.to_s, module: :devise, controllers: { registrations: "users/registrations" }
  end
end
