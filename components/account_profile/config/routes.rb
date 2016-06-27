AccountProfile::Engine.routes.draw do
  resources :users, only: [:show, :update]
  resource :user, only: [:edit]
end
