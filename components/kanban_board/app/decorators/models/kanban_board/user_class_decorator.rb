module KanbanBoard
	KanbanBoard.user_class.class_eval do
		has_many :projects_users, class_name: KanbanBoard::ProjectsUser
  	has_many :projects, through: :projects_users
  	has_many :projects_tasks, class_name: KanbanBoard::ProjectsTask
  	has_many :tasks, through: :projects_tasks
	end if KanbanBoard.user_class.present?
end