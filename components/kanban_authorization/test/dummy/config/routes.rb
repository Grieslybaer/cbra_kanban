Rails.application.routes.draw do

  mount KanbanAuthorization::Engine => "/kanban_authorization"
end
