class Product < ApplicationRecord
    has_many :invoices
    has_many :orders, through: :invoices
    validates :name, :price, presence: true
    validates :price, numericality: {greater_than: 0}
    accepts_nested_attributes_for :invoices
end
