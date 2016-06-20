AccountProfile::Engine.routes.draw do
  resources :users, only: [:show, :update]
  match 'users', to: 'users#index', constraints: { format: 'json' }, via: :get
  resource :user, only: [:edit]
end
