require 'rails_helper'

RSpec.describe "Products", type: :request do
  context "when not signed in" do
    it "shold GET /index" do
      get products_url
      expect(response).to be_successful
    end

    describe "GET /new" do
      it "should NOT GET /new" do
        get new_product_url
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET /edit" do
      it "should NOT GET /edit" do
        @product = create(:product)
        get edit_product_url(@product)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST /create" do
      it "should NOT POST /create" do
        @product = build(:product)
        expect {
          post '/products', params: {product: attributes_for(:product, name: @product.name, price: @product.price, id: @product.id)}
        }.to change{ Product.count }.by(0)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context "when signed in" do
    before do
      @user = create(:user)
      sign_in @user
    end

    it "shold GET /index" do
      get products_url
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
            post '/products', params: {product: attributes_for(:product, name: @product.name, price: @product.price, id: @product.id)}, xhr: true
          }.to change{Product.count}.by(1)
        end
      end
  
      context "with at least one parameter missing" do
        it "should NOT POST /create" do
          @product = build(:product, name: "")
          expect {
            post '/products', params: {product: attributes_for(:product, name: nil, price: @product.price, id: @product.id)}, xhr: true
          }.to change{Product.count}.by(0)
        end
      end
    end    
  end

end
