require "decorators"
require "kanban_board/engine"

module KanbanBoard
	mattr_accessor :user_class

	# overridung setter method to get Class instead of String
	def self.user_class
		@@user_class.constantize if @@user_class.present?
	end
end
