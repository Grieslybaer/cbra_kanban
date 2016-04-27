Rails.application.routes.draw do

  mount KanbanUser::Engine => "/kanban_user"
end
