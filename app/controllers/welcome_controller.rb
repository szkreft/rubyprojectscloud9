class WelcomeController < ApplicationController
    
    def welcome
        redirect_to articles_path if logged_in?
    end
    
    def about
    end
end
