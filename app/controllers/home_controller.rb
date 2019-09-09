class HomeController < ApplicationController
    def index
        @user = current_user if is_logged_in?
    end
end
