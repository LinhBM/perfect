class CreateShopDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_details do |t|
      t.integer :quantity
      t.float :price
      t.float :total
      t.references :shop, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
