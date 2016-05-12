Rails.application.routes.draw do

  mount KanbanUserProfile::Engine => "/kanban_user_profile"
end
