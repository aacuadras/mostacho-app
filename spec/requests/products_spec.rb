require 'rails_helper'

RSpec.describe "Products", type: :request do
  it "shold GET /index" do
    get products_url
    expect(response).to be_successful
  end

  it "should GET /show" do
    @product = create(:product)
    get product_url(@product)
    expect(response).to be_successful
  end

  it "should GET /new" do
    get new_product_url
    expect(response).to be_successful
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "should POST /create" do
        @product = build(:product)
        expect {
          post '/products', params: {product: attributes_for(:product, name: @product.name, price: @product.price, id: @product.id)}
        }.to change{Product.count}.by(1)
        assert_response :redirect
      end
    end

    context "with at least one parameter missing" do
      it "should NOT POST /create" do
        @product = build(:product, name: "")
        expect {
          post '/products', params: {product: attributes_for(:product, name: nil, price: @product.price, id: @product.id)}
        }.to change{Product.count}.by(0)

        assert_response :success
      end
    end
  end
end
