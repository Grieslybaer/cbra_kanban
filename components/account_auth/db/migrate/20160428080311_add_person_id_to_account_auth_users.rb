class AddPersonIdToAccountAuthUsers < ActiveRecord::Migration
  def change
    add_column :account_auth_users, :person_id, :integer
  end
end
