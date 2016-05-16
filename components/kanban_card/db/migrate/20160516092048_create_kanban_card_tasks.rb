class CreateKanbanCardTasks < ActiveRecord::Migration
  def change
    create_table :kanban_card_tasks do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.date :finishing_date

      t.timestamps null: false
    end
  end
end
