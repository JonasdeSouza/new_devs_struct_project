class ApplicationController < ActionController::Base
    def homepage
        session[:test] = "vc tem uma sessão"
        cookies.encrypted[:test] = "vc tem um cookie"
    end
end
