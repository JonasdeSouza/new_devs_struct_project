class ApplicationController < ActionController::Base
    def homepage
        session[:test] = "vc tem uma sessão"
        cookies.encrypted[:test] = "vc tem um cookie"
        @products = Product.all
        @categories = Category.all
    end

    def checkout
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
    helper_method :checkout
end
