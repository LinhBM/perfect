class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than: 0}
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def self.include? product_id
    where(product_id: product_id)
  end

  def total_price
    unit_price * quantity
  end

  private
  def product_present
    errors.add(:product, "is not valid or is not active.") unless product
  end

  def order_present
    errors.add(:order, "is not a valid order.") unless order
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

  def increment_product_quantity
    self.quantity += 1
    update_attributes quantity: self.quantity
  end
end
