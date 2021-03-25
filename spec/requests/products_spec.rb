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
end
