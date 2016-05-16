require "decorators"
require "kanban_board/engine"

module KanbanBoard
	mattr_accessor :user_class
	mattr_accessor :card_class
	mattr_accessor :states
	
	# overridung setter method to get Class instead of String
	def self.user_class
		@@user_class.constantize if @@user_class.present?
	end

	# overridung setter method to get Class instead of String
	def self.card_class
		@@card_class.constantize if @@card_class.present?
	end
end
