class SessionsController < ApplicationController
    def login
    end
  
    def post_login
    end
  
    def signup
    end
  
    def post_signup
  
    end
  
    def logout
  
    end
  
    private
      def user_params
        params.require(:user).permit(:email, :password)
      end
end
