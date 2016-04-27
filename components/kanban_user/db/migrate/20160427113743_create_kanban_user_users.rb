class CreateKanbanUserUsers < ActiveRecord::Migration
  def change
    create_table :kanban_user_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :role

      t.timestamps null: false
    end
  end
end
