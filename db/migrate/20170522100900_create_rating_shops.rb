class CreateRatingShops < ActiveRecord::Migration[5.0]
  def change
    create_table :rating_shops do |t|
      t.integer :value
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
