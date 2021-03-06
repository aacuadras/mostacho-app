require 'rails_helper'

RSpec.describe Order, type: :model do

  context "should be valid when" do

    it "all fields are correct" do
      order = create(:order)
      expect(order).to be_valid
    end

    it "delivery date is greater than or equal than today" do
      order = create(:order, delivery_date: Date.today)
      expect(order).to be_valid
    end
    
  end

  context "should be invalid when" do
    
    it "name is missing" do
      order = build(:order, name: "")
      expect(order).to be_invalid
    end

    it "delivery date is missing" do
      order = build(:order, delivery_date: "")
      expect(order).to be_invalid
    end

    it "status is missing" do
      order = build(:order, status: "")
      expect(order).to be_invalid
    end

    it "delivery date is less than today" do
      order = build(:order, delivery_date: Date.today - 20)
      expect(order).to be_invalid
    end

    it "status is not a valid keyword" do
      order = build(:order, status: "foo")
      expect(order).to be_invalid
    end

  end
end
