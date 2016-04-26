Rails.application.routes.draw do

  mount KanbanDashboard::Engine => "/kanban_dashboard"
end
