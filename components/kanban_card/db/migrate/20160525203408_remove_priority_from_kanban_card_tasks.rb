class RemovePriorityFromKanbanCardTasks < ActiveRecord::Migration
  def change
  	remove_column :kanban_card_tasks, :priority, :integer
  end
end
