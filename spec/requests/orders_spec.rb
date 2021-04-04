require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /index" do
    it "should GET /index" do
      get orders_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "should GET /show" do
      @order = create(:order)
      get order_url(@order)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "should GET /new" do
      get new_order_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "should GET /edit" do
      @order = create(:order)
      get edit_order_url(@order)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "should POST /create" do
        @product = create(:product)
        @order = build(:order)
        expect {
          post '/orders', params: {order: attributes_for(:order, name: @order.name, delivery_date: @order.delivery_date, status: @order.status, products: {@product.id => 1})}
        }.to change { Order.count }.by(1)
        .and change { Invoice.count }.by(1)
        
        assert_response :redirect
      end
    end

    context "with at least one parameter missing" do
      it "should NOT POST /create" do
        @product = create(:product)
        @order = build(:order)
        expect {
          post '/orders', params: {order: attributes_for(:order, name: nil, delivery_date: @order.delivery_date, status: @order.status, products: {@product.id => 1})}
        }.to change { Order.count }.by(0)
      end
    end

    context "with a delivery date before today" do
      it "should NOT POST /create" do
        @product = create(:product)
        @order = build(:order)
        expect {
          post '/orders', params: {order: attributes_for(:order, name: @order.name, delivery_date: Date.today - 5, status: @order.status, products: {@product.id => 1})}
        }.to change{ Order.count }.by(0)
      end
    end
  end

end
