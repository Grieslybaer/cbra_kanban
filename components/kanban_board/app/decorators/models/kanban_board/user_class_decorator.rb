module KanbanBoard
	KanbanBoard.user_class.class_eval do
		has_many :members, class_name: KanbanBoard::Member.to_s, foreign_key: "user_id", dependent: :destroy
  	has_many :projects, through: :members, class_name: KanbanBoard::Project.to_s
  	has_many :assignments, class_name: KanbanBoard::Assignment.to_s, foreign_key: "user_id"
  	has_many :tasks, through: :assignments, class_name: KanbanBoard.card_class.to_s
	end if KanbanBoard.user_class.present?
end