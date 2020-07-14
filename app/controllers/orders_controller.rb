class OrdersController < ApplicationController
 
    def index
        @orders = Order.all
        @products = Product.all
        @users = User.all
    end
  
    def create
        order = Order.new(orders_params)
        begin
            order.save!
            flash[:notice] = "Pedido de #{order.product.name} adicionado com sucesso!"
        rescue => exc
            puts exc
            flash[:notice] = exc
        ensure
            redirect_to orders_path
        end
    end
    helper_method :create
  
    def new
        @order = Order.new
        @product = Product.find_by(params[:id])
    end
  
    def edit
        @order = Order.find(params[:id])
        @product = Product.find(@order.product_id)
    end
  
    def show
        @order = Order.find(params[:id])
        @product = Product.find(@order.product_id)
        @total_value = @order.quantity * @product.price
    end
  
    def update
        order = Order.find(params[:id])
        begin
            order.update!(orders_params)
            flash[:notice] = "Pedido alterado com sucesso!"
        rescue => exc
            puts exc
            flash[:notice] = exc
        ensure
            redirect_to orders_path
        end
    end
  
    def destroy
        order = Order.find(params[:id])
        begin
            order.destroy!
            flash[:notice] = "Pedido de #{order.product.name} deletado com sucesso!"
        rescue => exc
            puts exc
            flash[:notice] = exc
        ensure
            redirect_to orders_path
        end
    end
  
    private

    def orders_params
        params.require('order').permit(:quantity, :product_id, :user_id)
    end


 end
 