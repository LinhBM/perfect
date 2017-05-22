class User < ApplicationRecord
  has_one :cart
  has_one :shop

  has_many :relationships, dependent: :destroy
  has_many :comment_products
  has_many :comment_shops
  has_many :rating_products
  has_many :rating_shops
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
end
