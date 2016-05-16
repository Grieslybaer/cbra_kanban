module KanbanBoard
  class ProjectsTask < ActiveRecord::Base
  	belongs_to :project
  	belongs_to :card, class_name: KanbanBoard.card_class.to_s
  	belongs_to :user, class_name: KanbanBoard.user_class.to_s

  	before_create :set_status

  	private
  	def set_status
  		self.status = KanbanBoard.states.first
  	end
  end
end
