require 'rails_helper'

RSpec.describe Order, type: :model do

  context "should be valid when" do

    it "all fields are correct" do
      order = create(:order, :complete)
      expect(order).to be_valid
    end

    it "delivery date is greater than or equal than today" do
      order = create(:order, :complete, delivery_date: Date.today)
      expect(order).to be_valid
    end
    
  end

  context "should be invalid when" do
    
    it "name is missing" do
      order = build(:order, :complete, name: "")
      expect(order).to be_invalid
    end

    it "delivery date is missing" do
      order = build(:order, :complete, delivery_date: "")
      expect(order).to be_invalid
    end

    it "status is missing" do
      order = build(:order)
      expect(order).to be_invalid
    end

    it "delivery date is less than today" do
      order = build(:order, :complete, delivery_date: Date.today - 20)
      expect(order).to be_invalid
    end

  end
end
