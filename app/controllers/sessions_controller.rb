class SessionsController < ApplicationController
    def login
        @user = User.new
    end

    def signup
        @user = User.new
    end

    def post_login
        @user = User.find_by(email: user_params[:email])
        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :login
        end
    end

    def post_signup
        user = User.new(user_params)
        if user.save 
            session[:user_id] = user.id
            redirect_to root_path
        else
            render :signup
        end
    end

    def logout
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
