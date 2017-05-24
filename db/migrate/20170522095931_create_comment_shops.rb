class CreateCommentShops < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_shops do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
