class CreateKanbanBoardProjects < ActiveRecord::Migration
  def change
    create_table :kanban_board_projects do |t|
      t.string :name
      t.text :description
      t.date :finishing_date

      t.timestamps null: false
    end
  end
end
