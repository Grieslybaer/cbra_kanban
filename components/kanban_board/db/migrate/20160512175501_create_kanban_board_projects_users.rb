class CreateKanbanBoardProjectsUsers < ActiveRecord::Migration
  def change
    create_table :kanban_board_projects_users do |t|
    	t.integer :project_id
    	t.integer :user_id
    	t.string :user_role
      t.timestamps null: false
    end
  end
end
