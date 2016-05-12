class AddColumnsToKanbanUserUsers < ActiveRecord::Migration
  def change
    add_column :kanban_user_users, :first_name, :string
    add_column :kanban_user_users, :last_name, :string
  end
end
