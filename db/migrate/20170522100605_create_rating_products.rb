class CreateRatingProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :rating_products do |t|
      t.integer :value
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
    add_index :rating_products, :user_id, unique: true
    add_index :rating_products, :product_id, unique: true
  end
end
