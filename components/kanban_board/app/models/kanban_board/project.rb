module KanbanBoard
  class Project < ActiveRecord::Base
  	has_many :projects_users
  	has_many :users, through: :projects_users

  	alias_attribute :title, :name
  	alias_attribute :deadline, :finishing_date
  end
end
