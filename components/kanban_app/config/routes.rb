KanbanApp::Engine.routes.draw do
	mount KanbanBoardUi::Engine, at: "/kanban_board"

	root to: "kanban_board/project#index"
end
