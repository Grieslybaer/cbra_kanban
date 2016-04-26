KanbanAccount::Engine.routes.draw do
  devise_for :users, class_name: "KanbanAccount::User", module: :devise
end
