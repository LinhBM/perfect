class Shop < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_mamy :shop_details, dependent: :destroy
  has_mamy :comment_shop, dependent: :destroy
  has_mamy :rating_shop, dependent: :destroy
end
