class Product < ApplicationRecord
    has_many :invoices
    has_many :orders, through: :invoices
    has_one_attached :photo, dependent: :destroy
    validates :name, :price, presence: true
    validates :price, numericality: {greater_than: 0}
    validates :photo, content_type: {in: %w[image/jpeg image/png image/jpg], message: "image must be a valid format"},
        size: {less_than: 5.megabytes, message: "image size must be less than 5MB"}
    accepts_nested_attributes_for :invoices
end
