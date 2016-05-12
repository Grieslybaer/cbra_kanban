AccountAuth::Engine.routes.draw do
	if AccountAuth.user_class.present?
  	devise_for :users, class_name: AccountAuth.user_class.to_s, module: :devise
	end
end
