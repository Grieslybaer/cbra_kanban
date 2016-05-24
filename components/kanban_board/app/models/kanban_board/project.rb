module KanbanBoard
  class Project < ActiveRecord::Base
  	has_many :members
  	has_many :users, through: :members

  	has_many :administrators, -> { where user_role: 'admin' }, class_name: KanbanBoard::Member.to_s
  	has_many :owners, through: :administrators, source: :user

  	has_many :assignments
  	has_many :tasks, through: :assignments

  	alias_attribute :title, :name
  	alias_attribute :deadline, :finishing_date
  end
end
