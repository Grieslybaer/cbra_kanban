Rails.application.routes.draw do

  mount KanbanBoardUi::Engine => "/kanban_board_ui"
end
