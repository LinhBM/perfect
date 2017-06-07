class CreateCommentProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_products do |t|
      t.text :content
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
    add_index :comment_products, :user_id
    add_index :comment_products, :product_id
  end
end
