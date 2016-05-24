module KanbanBoard
  class Member < ActiveRecord::Base
  	belongs_to :project
  	belongs_to :user, class_name: KanbanBoard.user_class.to_s

  	@@roles = %w(admin dev)

  	validates :user, :project, :user_role, presence: true
  	validates :user_role, inclusion: { in: @@roles }

  	alias_attribute :role, :user_role
  end
end
