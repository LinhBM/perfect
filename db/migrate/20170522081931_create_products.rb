class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.text :description
      t.string :image
      t.float :avg_rating
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
    add_index :products, :category_id, unique: true
    add_index :products, :user_id, unique: true
  end
end
