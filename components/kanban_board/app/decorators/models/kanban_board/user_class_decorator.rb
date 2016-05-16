module KanbanBoard
	KanbanBoard.user_class.class_eval do
		has_many :projects_users, class: KanbanBoard::ProjectsUser
  	has_many :projects, through: :projects_users
	end if KanbanBoard.user_class.present?
end