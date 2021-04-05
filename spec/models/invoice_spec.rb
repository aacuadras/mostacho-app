require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context "should be valid when" do
    it "all fields are correct" do
      invoice = create(:invoice)
      expect(invoice).to be_valid
    end
    it "quantity is greater than 0" do
      invoice = create(:invoice, quantity: 5)
      expect(invoice).to be_valid
    end
  end

  context "should be invalid when" do
    it "order is missing" do
      invoice = build(:invoice, order: nil)
      expect(invoice).to be_invalid
    end

    it "product is missing" do
      invoice = build(:invoice, product: nil)
      expect(invoice).to be_invalid
    end

    it "quantity is missing" do
      invoice = build(:invoice, quantity: nil)
      expect(invoice).to be_invalid
    end

    it "quantity is less than 1" do
      invoice = build(:invoice, quantity: 0)
      expect(invoice).to be_invalid
    end
  end
end
