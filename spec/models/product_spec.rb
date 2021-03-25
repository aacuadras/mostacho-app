require 'rails_helper'

RSpec.describe Product, type: :model do

  context "should be valid when" do 

    it "all fields are correct" do
      product = create(:product)
      expect(product).to be_valid
    end

    it "price is greater than 0" do
      product = create(:product, price: 10)
      expect(product).to be_valid
    end

  end

  context "should be invalid when" do

    it "name is missing" do
      product = build(:product, name: "")
      expect(product).to_not be_valid
    end

    it "price is missing" do
      product = build(:product, price: "")
      expect(product).to be_invalid
    end

    it "price is 0 or less" do
      product = build(:product, price: 0)
      expect(product).to be_invalid
    end

  end

end
