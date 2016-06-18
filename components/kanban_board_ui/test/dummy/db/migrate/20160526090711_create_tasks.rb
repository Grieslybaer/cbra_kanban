class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :finishing_date

      t.timestamps null: false
    end
  end
end
