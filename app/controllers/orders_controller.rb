class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :checkout

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

    def checkout

        puts params
        final = 0.0
        params["_json"].each do |item|
            Order.create(user_id: current_user.id, product_id: item[:id], quantity: item[:count])
            price = item[:price]
            qnt = item[:count]
            final = price * qnt
        end
        current_user.balance = -final
        current_user.save!
        # Order.all.each do |order|
        #     if order.user_id === current_user.id
        #         begin
        #             product = Product.find(order.product_id)
        #             if product.quantity >= order.quantity
        #                 product.quantity -= order.quantity
        #                 product.save!
        #                 order.destroy!
        #                 flash[:notice] = "Compra finalizada com sucesso"
        #             else
        #                 order.destroy!
        #                 flash[:notice] = "Oops! Parece que a quantidade selecionada do produto #{product.name} não está mais disponível. Removendo do carrinho..."
        #                 break
        #             end
        #         rescue => exc
        #             puts exc
        #             flash[:notice] = exc
        #         ensure
        #             redirect_to orders_path
        #         end
        #     end
        # end
    end
    helper_method :checkout

    private

    def orders_params
        params.require('order').permit(:quantity, :product_id, :user_id)
    end


 end
 