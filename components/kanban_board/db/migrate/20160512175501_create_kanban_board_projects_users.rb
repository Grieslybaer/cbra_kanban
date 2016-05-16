class CreateKanbanBoardProjectsUsers < ActiveRecord::Migration
  def change
    create_table :kanban_board_projects_users do |t|
    	t.integer :project_id, index: true
    	t.integer :user_id, index: true
    	t.string :user_role, null: false
      t.timestamps null: false
    end
  end
end
