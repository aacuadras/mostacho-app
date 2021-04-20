class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :destroy, :show]
    before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]

    def index
      @products = Product.all.order(:name)
    end

    def new
      @product = Product.new
      respond_to do |format|
        format.html
        format.js
      end
    end

    def edit
      respond_to do |format|
        format.html
        format.js
      end
    end

    def create
      @product = Product.new(product_params)
      respond_to do |format|
        if @product.save
          format.html { redirect_to products_url, notice: "#{@product.name} fue creado!" }
          format.json { render :show, status: :created, location: @product}
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: "#{@product.name} fue actualizado!" }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { redner json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @product.destroy
      respond_to do |format|
          format.html { redirect_to products_url, notice: 'Product was successfully deleted' }
          format.json { head :no_content }
      end
    end

    private

    def set_product
      @product = Product.find_by(id: params[:id])
    end

    def product_params 
      params.require(:product).permit(:name, :price, :photo)
    end
end
