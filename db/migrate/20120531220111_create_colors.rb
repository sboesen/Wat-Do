class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.integer :red
      t.integer :green
      t.integer :blue
      t.string :name

      t.timestamps
    end
  end
end
