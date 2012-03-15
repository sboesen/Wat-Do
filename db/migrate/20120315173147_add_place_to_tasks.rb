class AddPlaceToTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :place, :string
  end
  def down
    remove_column :tasks, :place
  end
end
