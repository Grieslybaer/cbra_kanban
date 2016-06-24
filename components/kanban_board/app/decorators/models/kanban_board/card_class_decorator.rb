module KanbanBoard
	KanbanBoard.card_class.class_eval do
		has_one :assignment, class_name: KanbanBoard::Assignment.to_s, dependent: :destroy
  	has_one :project, through: :assignment, class_name: KanbanBoard::Project.to_s
  	has_one :user, through: :assignment, class_name: KanbanBoard.user_class.to_s

  	accepts_nested_attributes_for :assignment
	end if KanbanBoard.card_class.present?
end