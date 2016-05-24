module KanbanCard
  class Task < ActiveRecord::Base
  	validates :name, :finishing_date, presence: true

  	alias_attribute :title, :name
  	alias_attribute :deadline, :finishing_date
  end
end
