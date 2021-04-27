class Product < ApplicationRecord
    after_update_commit {broadcast_replace_to "products"}
    after_destroy_commit {broadcast_remove_to "products"}

    has_many :invoices
    has_many :orders, through: :invoices
    has_one_attached :photo, dependent: :destroy
    validates :name, :price, presence: true
    validates :price, numericality: {greater_than: 0}
    validates :photo, content_type: {in: %w[image/jpeg image/png image/jpg], message: "Formato equivocado de imagen"},
        size: {less_than: 5.megabytes, message: "El tamaño de la imagen no debe de exceder 5MB"}
    accepts_nested_attributes_for :invoices
end
