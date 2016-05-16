class CreateKanbanBoardProjectsTasks < ActiveRecord::Migration
  def change
    create_table :kanban_board_projects_tasks do |t|
    	t.integer :project_id, index: true
    	t.integer :card_id, index: true
    	t.integer :user_id, index: true
    	t.string :status, null: false
      t.timestamps null: false
    end
  end
end
