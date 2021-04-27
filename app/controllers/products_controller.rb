class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :destroy, :show]
    before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]

    #GET /products
    def index
      @products = Product.all.order(:name)
    end

    #GET /products/new
    def new
      @product = Product.new
    end

    #GET /products/edit
    def edit
    end

    #POST /products
    def create
      @product = Product.new(product_params)
      respond_to do |format|
        if @product.save
          format.turbo_stream
          format.html { redirect_to products_url, notice: "#{@product.name} fue creado!" }
          format.json { render :show, status: :created, location: @product}
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    #PATCH/PUT /products/:id
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

    #DELETE /products/:id
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
