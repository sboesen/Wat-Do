class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :user_id
      t.integer :color_id

      t.timestamps
    end
    add_index :categories, :user_id, :name => 'category_user_id_ix'
  end
end
