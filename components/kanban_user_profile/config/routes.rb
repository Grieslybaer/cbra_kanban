KanbanUserProfile::Engine.routes.draw do
  resources :users, only: [:show, :edit, :update]
  match 'users', to: 'users#index', constraints: { format: 'json' }, via: :get
end
