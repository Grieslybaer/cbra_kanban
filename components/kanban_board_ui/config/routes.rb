KanbanBoardUi::Engine.routes.draw do
  resources :projects do
  	resources :tasks
  	resources :assignments, only: [:update]
  end
  root to: 'projects#index'
end
