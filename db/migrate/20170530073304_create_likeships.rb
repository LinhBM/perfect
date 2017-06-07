class CreateLikeships < ActiveRecord::Migration[5.0]
  def change
    create_table :likeships do |t|
      t.integer :user_id
      t.integer :comment_product_id

      t.timestamps
    end
    add_index :likeships, :user_id
    add_index :likeships, :comment_product_id
  end
end
