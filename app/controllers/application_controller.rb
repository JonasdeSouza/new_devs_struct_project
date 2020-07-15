class ApplicationController < ActionController::Base
    def homepage
        session[:test] = "vc tem uma sessão"
        cookies.encrypted[:test] = "vc tem um cookie"
        @products = Product.all
        @categories = Category.all
    end

end
