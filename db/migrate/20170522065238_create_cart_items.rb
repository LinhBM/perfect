class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.float :price
      t.float :total
      t.references :cart, foreign_key: true
      t.references :shop_detail, foreign_key: true

      t.timestamps
    end
  end
end
