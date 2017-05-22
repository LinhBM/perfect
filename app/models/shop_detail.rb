class ShopDetail < ApplicationRecord
  belongs_to :shop
  belongs_to :product

  has_many :cart_items
end
