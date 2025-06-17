class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

   def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
 def authenticate_user
    if current_user.nil?
      flash[:error] = "You must be signed in to view that page."
      redirect_to login_path
    end
  end
end
