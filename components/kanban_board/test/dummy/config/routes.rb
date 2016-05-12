Rails.application.routes.draw do

  mount KanbanBoard::Engine => "/kanban_board"
end
