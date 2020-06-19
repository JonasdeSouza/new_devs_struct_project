class OrdersController < ApplicationController
 
    def index
        @orders = Order.all
        @products = Product.all
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
  
    def new
        @order = Order.new
    end
  
    def edit
        @order = Order.find(params[:id])
    end
  
    def show
        @order = Order.find(params[:id])
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
        params.require('order').permit(:quantity)
    end
 end
 