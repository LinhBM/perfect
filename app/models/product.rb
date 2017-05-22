class Product < ApplicationRecord
  belongs_to :category

  has_many :shop_details
  has_many :comment_products, dependent: :destroy
  has_many :rating_product, dependent: :destroy
end
