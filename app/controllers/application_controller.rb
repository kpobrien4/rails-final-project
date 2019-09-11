class ApplicationController < ActionController::Base
  helper_method :is_logged_in?
  helper_method :current_user

  def redirect_if_not_signed_in
    redirect_to login_path unless is_logged_in?
  end

  def redirect_if_signed_in
    redirect_to projects_path if is_logged_in?
  end
  

  private
    def is_logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id]) if is_logged_in?
    end
end
