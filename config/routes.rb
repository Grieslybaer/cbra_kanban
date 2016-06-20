Rails.application.routes.draw do
  mount AccountProfile::Engine, at: '/profile', as: 'account_profile'
  mount AccountAuthentication::Engine, at: '/account', as: 'account_auth'
  mount KanbanBoardUi::Engine, at: '/projects', as: 'kanban_board'

  root to: 'kanban_board_ui/projects#index'
end
