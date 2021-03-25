class Order < ApplicationRecord
    has_and_belongs_to_many :products
    validates :name, :delivery_date, :status, presence: true
    validate :date_equal_or_after_today


    private

    def date_equal_or_after_today
        return if delivery_date.blank?
        
        if delivery_date < Date.today
            errors.add(:delivery_date, "Delivery date must be today onwards")
        end
    end
end
