module KanbanBoard
	KanbanBoard.card_class.class_eval do
		has_one :assignment, class_name: KanbanBoard::Assignment
  	has_one :project, through: :assignment
  	has_one :user, through: :assignment

  	accepts_nested_attributes_for :assignment
	end if KanbanBoard.card_class.present?
end