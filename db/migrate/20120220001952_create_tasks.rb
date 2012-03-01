class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :tasks, :user_id, :name => 'user_id_ix'
  end
end
