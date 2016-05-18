module KanbanBoard
  class Member < ActiveRecord::Base
  	belongs_to :project
  	belongs_to :user, class_name: KanbanBoard.user_class.to_s
  end
end
