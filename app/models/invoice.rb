class Invoice < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validate :quantity_greater_than_zero

  def quantity_greater_than_zero
    return if quantity.blank?
    errors.add(:quantity, "Quantity must be greater than 0") if quantity <= 0
  end
end
