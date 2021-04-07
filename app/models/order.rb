class Order < ApplicationRecord
    has_many :invoices
    has_many :products, through: :invoices
    validates :name, :delivery_date, :status, presence: true
    validate :date_equal_or_after_today, on: :create
    validates :status, inclusion: {in: %w(active ready_to_deliver complete)}
    accepts_nested_attributes_for :invoices

    def create_invoices(products)
        products.each do |k, v|
            if v.to_i > 0
                i = Invoice.create(order_id: self.id, product_id: k.to_i, quantity: v.to_i)
            end
        end
    end

    def edit_invoices(products)
        products.each do |k,val|
            if val.to_i > 0 
                i = Invoice.find_by(product_id: k.to_i, order_id: self.id)
                if(!i.nil? && i.quantity != val.to_i )
                    #this means that the invoice exists, but it doesn't have the same quantity
                    i.update(quantity: val.to_i)
                elsif(i.nil?)
                    Invoice.create(order_id: self.id, product_id: k.to_i, quantity: val.to_i)
                end
            end
        end
    end

    def get_price
        price = 0
        invoices = Invoice.where(order_id: self.id)
        invoices.each do |i|
            price += Product.find_by(id: i.product_id).price * i.quantity
        end

        return price
    end

    def get_status
        return "Ready to Deliver" if self.status == "ready_to_deliver"
        return self.status.capitalize
    end

    def change_status
        if self.status == "active"
            self.status = "ready_to_deliver"
        elsif self.status == "ready_to_deliver"
            self.status = "complete"
        end
    end

    def self.active_orders
        Order.where(status: ["active", "ready_to_deliver"])
    end

    def self.completed_orders
        Order.where(status: "complete")
    end

    private

    def date_equal_or_after_today
        return if delivery_date.blank?
        
        if delivery_date < Date.today
            errors.add(:delivery_date, "Delivery date must be today onwards")
        end
    end
end
