class RemoveDateLocationFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :place
    remove_column :tasks, :date
  end
end
