class AddDateToTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :date, :datetime
  end
  def down
    remove_column :tasks, :date
  end
end
