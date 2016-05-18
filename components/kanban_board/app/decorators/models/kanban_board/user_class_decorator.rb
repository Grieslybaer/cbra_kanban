module KanbanBoard
	KanbanBoard.user_class.class_eval do
		has_many :members, class_name: KanbanBoard::Member
  	has_many :projects, through: :members
  	has_many :assignments, class_name: KanbanBoard::Assignment
  	has_many :tasks, through: :assignments
	end if KanbanBoard.user_class.present?
end