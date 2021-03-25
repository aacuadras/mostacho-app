class Product < ApplicationRecord
    has_and_belongs_to_many :orders
    validates :name, :price, presence: true
    validates :price, numericality: {greater_than: 0}
end
