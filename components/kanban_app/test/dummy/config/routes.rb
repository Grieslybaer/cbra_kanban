Rails.application.routes.draw do

  mount KanbanApp::Engine => "/kanban_app"
end
