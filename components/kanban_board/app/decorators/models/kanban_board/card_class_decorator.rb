module KanbanBoard
	KanbanBoard.card_class.class_eval do
		has_one :projects_task, class_name: KanbanBoard::ProjectsTask
  	has_one :project, through: :projects_task
  	has_one :user, through: :projects_task
	end if KanbanBoard.card_class.present?
end