class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    before_action :set_products, only: [:edit, :new, :update, :create]

    def index
        @orders = Order.all
    end

    def show

    end

    def edit

    end

    def new
        @order = Order.new
        Product.count.times {@order.invoices.build}
    end

    def create
        @order = Order.new(name: order_params[:name], delivery_date: order_params[:delivery_date], status: "active")

        respond_to do |format|
            if @order.save
                CreateInvoices.call({order: @order, products: order_params[:products]})
                format.html { redirect_to @order, notice: "Product was successfully created" }
                format.json { render :show, status: :created, location: @order }
            else
                format.html { render :new }
                format.json { render json: @order.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @order.update(name: order_params[:name], delivery_date: order_params[:delivery_date])
                EditInvoices.call({order: @order, products: order_params[:products]})
                format.html {redirect_to @order, notice: 'Order was successfully updated.'}
                format.json { render :show, status: :ok, location: @order }
            else
                format.html { render :edit }
                format.json { render json: @order.errors, status: :unprocessable_entity}
            end
        end
    end

    private
    def set_order
        @order = Order.find_by(id: params[:id])
    end

    def set_products
        @products = Product.all
    end

    def order_params
        params.require(:order).permit(:name, :delivery_date, products: {})
    end
end
