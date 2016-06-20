class AddNameToAccountUsers < ActiveRecord::Migration
  def change
    add_column :account_users, :first_name, :string
    add_column :account_users, :last_name, :string
  end
end
